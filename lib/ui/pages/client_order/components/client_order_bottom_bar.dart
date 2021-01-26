import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../client_order_presenter.dart';

class ClientOrderBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20);
    final presenter = Provider.of<ClientOrderPresenter>(context);

    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("3 clientes selecionados", style:textStyle ,),
            GestureDetector(
              onTap: (){
              Get.toNamed("/finish_order");
              },
                child: Text("Avançar >", style:textStyle,)),
          ],
        ),
      ),
    );
  }
}
