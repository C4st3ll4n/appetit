import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../new_order_presenter.dart';

class NewOrderBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20);
    final presenter = Provider.of<NewOrderPresenter>(context);

    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Total: R\$ 3,25", style:textStyle ,),
            GestureDetector(
              onTap: (){
              presenter.goToSelectClient();
              },
                child: Text("Avançar >", style:textStyle,)),
          ],
        ),
      ),
    );
  }
}
