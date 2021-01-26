import 'package:fappetite/presentation/presenters/getx_new_order_presenter.dart';

import 'client_item.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/entities.dart';

class ClientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<GetXNewOrderPresenter>(context);
    //presenter.search();
    return StreamBuilder<List>(
      stream: presenter.dataStream,
      builder: (BuildContext bc, data) {
        if (!data.hasData) {
          return ListTile(
            title: Text("Nenhum client"),
          );
        } else {
          Map<String, List> _elements = {};
          for (ProductEntity item in data.data) {
            if (!_elements.containsKey(item.category)) {
              _elements[item.category] = List()..add(item);
            } else {
              _elements[item.category].add(item);
            }
          }

          return GroupListView(
            sectionsCount: _elements.keys.toList().length,
            countOfItemInSection: (int section) =>
                _elements.values.toList()[section].length,
            itemBuilder: (BuildContext context, IndexPath index) {
              return ClientItem(
                client: _elements.values.toList()[index.section]
                    [index.index],
              );
            },
            groupHeaderBuilder: (BuildContext context, int section) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  _elements.keys.toList()[section],
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
