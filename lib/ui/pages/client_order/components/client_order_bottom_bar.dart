import 'dart:developer';

import 'package:fappetite/domain/entities/client_entity.dart';
import 'package:fappetite/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../client_order_presenter.dart';

class ClientOrderBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18);
    final presenter = Provider.of<ClientOrderPresenter>(context);

    return StreamBuilder<List<ClientEntity>>(
      stream: presenter.selectedClients,
      builder: (_, snapshot) {
        if(snapshot.hasData){
        }
        return BottomAppBar(
          color: Theme.of(context).primaryColor,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${snapshot.data?.length??0} cliente(s) selecionado(s)",
                  style: textStyle,
                ),
                GestureDetector(
                    onTap: () {
                      //Get.toNamed("/product_details");
                      if(snapshot.data?.length==0){
                        showErrorMessage(context, "Selecione pelo menos um cliente");
                      }else{
                        //presenter.goToSelectClient();
                        Get.toNamed("/finish_order");
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
