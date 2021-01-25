import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../home_presenter.dart';

class NewOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<HomePresenter>(context);

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(),
        color: Colors.white,
        onPressed: presenter.goToMakeOrder,
        label: Text(
          "FAZER NOVO PEDIDO",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.orange,
        ),
      ),
    );
  }
}
