import 'package:fappetite/domain/entities/client_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../client_order_presenter.dart';

class ClientItem extends StatelessWidget {
  final ClientEntity client;

  const ClientItem({Key key, this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ClientOrderPresenter>(context);
    NumberFormat formatter = NumberFormat.currency(
        locale: "pt_BR", name: "reais", symbol: "R\$", decimalDigits: 2);
    final titleTextStyleSelected = TextStyle(
      color: Colors.white,
    );
    final subtitleTextStyleSelected = TextStyle(
      color: Colors.white,
    );


    final selected = client.name == "Cuscuz completo";
    return Card(
      elevation: 2,
      child: ListTile(
        selected: selected,
        selectedTileColor: Theme.of(context).primaryColor,
        onTap: () {
        },
        title: Text(
          client.name,
          style: selected ? titleTextStyleSelected : null,
        ),
        leading: CircleAvatar(
          child: ClipRRect(
            child: Image(
              image: NetworkImage(client.imageNetworkPath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      
      ),
    );
  }
}
