import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'home_presenter.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;

  HomePage({this.presenter});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Text(
                "Olá, ${faker.person.firstName()} !",
                textAlign: TextAlign.start,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.green),
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
