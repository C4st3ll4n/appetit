import 'package:fappetite/ui/pages/finish_order/finish_order_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<FinishOrderPresenter>(context);

    return StreamBuilder<bool>(
      stream: presenter.isFormValid,
      builder: (context, snapshot) {
        return ButtonTheme(
          minWidth: double.infinity,
          height: 60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: RaisedButton(
            textColor: Colors.white,
            disabledTextColor: Colors.white,
            disabledColor: Theme.of(context).primaryColorDark.withAlpha(60),
            child: Text("Entrar".toUpperCase()),
            onPressed: snapshot.data == true ? presenter.finish: null,
          ),
        );
      },
    );
  }
}
