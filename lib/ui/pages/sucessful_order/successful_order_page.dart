import 'package:fappetite/ui/pages/sucessful_order/components/components.dart';
import 'package:flutter/material.dart';

class SuccessfulOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                child: Image.asset("assets/icon/android.png"),
              ),
              NewOrderButton()
            ],
          ),
        ),
      ),
    );
  }
}
