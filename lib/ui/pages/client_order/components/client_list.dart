import 'dart:developer';

import 'package:provider/provider.dart';
import 'client_item.dart';
import 'package:flutter/material.dart';
import '../client_order_presenter.dart';
import '../../../../domain/entities/entities.dart';

class ClientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ClientOrderPresenter>(context);
    //presenter.search();
    return StreamBuilder<List>(
      stream: presenter.dataStream,
      builder: (BuildContext bc, snap) {
        if (!snap.hasData) {
          return ListTile(
            title: Text("Nenhum cliente"),
          );
        } else {
          return StreamBuilder(
            stream: presenter.selectedClients,
            builder: (BuildContext context,
                AsyncSnapshot<List<ClientEntity>> snapshot) {
              
              return ListView.builder(
                itemCount: snap.data.length ?? 0,
                itemBuilder: (_, i) {
                  final ClientEntity _entity = snap.data[i];
                  return ClientItem(
                    client: _entity,
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
