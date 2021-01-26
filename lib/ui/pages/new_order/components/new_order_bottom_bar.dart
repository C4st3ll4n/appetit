import 'dart:developer';

import 'package:fappetite/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../../presentation/presenters/getx_new_order_presenter.dart';

class NewOrderBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat.currency(
        locale: "pt_BR", name: "reais", symbol: "R\$", decimalDigits: 2);
    final textStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20);
    final presenter = Provider.of<GetXNewOrderPresenter>(context);

    return StreamBuilder<double>(
      stream: presenter.totalPrice.stream,
      builder: (_, snapshot) {
        if(snapshot.hasData){
        }
        return BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total: ${formatter.format(snapshot.data??0.0)}",
                style: textStyle,
              ),
              GestureDetector(
                  onTap: () {
                    //Get.toNamed("/product_details");
                    if(snapshot.data==0){
                      showErrorMessage(context, "Selecione pelo menos um item");
                    }else{
                      presenter.goToSelectClient();
                    }
                  },
                  child: Text(
                    "Avançar >",
                    style: textStyle,
                  )),
            ],
          ),
        ),
      );
      },
    );
  }
}
