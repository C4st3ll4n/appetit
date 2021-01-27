import 'package:flutter/material.dart';

class NewOrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: RaisedButton(
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          disabledColor: Theme.of(context).primaryColorDark.withAlpha(60),
          child: Text(
            "Finalizar".toUpperCase(),
          ),
          onPressed: () {}),
    );
  }
}
