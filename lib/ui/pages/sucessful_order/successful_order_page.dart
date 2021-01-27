import 'package:fappetite/ui/pages/sucessful_order/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessfulOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("lib/ui/assets/chef.png"),
                ),
                Text("Pedido realizado !"),
                NewOrderButton(onTap: (){
                  Get.offAllNamed("/new_order", );
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
