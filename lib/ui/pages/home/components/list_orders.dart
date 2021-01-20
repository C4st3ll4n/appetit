import 'package:fappetite/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:provider/provider.dart';

import '../../pages.dart';
import 'order_item.dart';

class ListOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<HomePresenter>(context);

    return StreamBuilder<List>(
      stream: presenter.dataStream,
      builder: (BuildContext bc, data) {
        if (!data.hasData) {
          return ListTile(
            title: Text("Nenhum pedido"),
          );
        } else {
          Map<String, List> _elements = {};
          for (OrderEntity item in data.data) {
            if (!_elements.containsKey("${item.soldDay}/${item.soldMonth}")) {
              _elements["${item.soldDay}/${item.soldMonth}"] = List()
                ..add(item);
            } else {
              _elements["${item.soldDay}/${item.soldMonth}"].add(item);
            }
          }

          return GroupListView(
            sectionsCount: _elements.keys.toList().length,
            countOfItemInSection: (int section) =>
                _elements.values.toList()[section].length,
            itemBuilder: (BuildContext context, IndexPath index) {
              return OrderItem(
                order: _elements.values.toList()[index.section][index.index],
              );
            },
            groupHeaderBuilder: (BuildContext context, int section) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text(
                  "Em ${_elements.keys.toList()[section]} você vendeu R\$ 16,50",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
          );
        }
      },
    );
  }
}
