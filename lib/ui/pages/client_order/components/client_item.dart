import 'package:fappetite/domain/entities/client_entity.dart';
import 'package:flutter/cupertino.dart';
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
   
    final titleTextStyleSelected = TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold,
    );
    final titleTextStyleUnselected = TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold,
    );


    bool selected = presenter.contains(client);
    return Card(
      elevation: 2,
      child: ListTile(
        selected: selected,
        selectedTileColor: Theme.of(context).primaryColor,
        onTap: () {
          presenter.toggleClient(client);
        },
        //onLongPress:()=> presenter.toggleClient(client),
        title: Text(
          client.name,
          style: selected ? titleTextStyleSelected : titleTextStyleUnselected,
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
