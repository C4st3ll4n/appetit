import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key key, this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "Olá, $name !",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColorDark,
                  letterSpacing: 1.6),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Divider(
              color: Colors.green,
              thickness: 2,
              indent: 0,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
