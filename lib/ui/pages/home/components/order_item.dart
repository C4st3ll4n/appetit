import 'package:fappetite/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class OrderItem extends StatelessWidget {
  const OrderItem({Key key, this.order}) : super(key: key);

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat.currency(locale:"pt_BR", name:"reais", symbol:"R\$", decimalDigits: 2);
    return Card(
      child: ListTile(
        title: Text(order.clientName),
        subtitle: Text(order.description),
        leading: CircleAvatar(
          child: ClipRRect(
            child: Image(
              image: NetworkImage(order.imageNetworkPath),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        trailing: Text("${formatter.format(order.totalPrice)}",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
