import 'package:faker/faker.dart';
import 'package:fappetite/ui/pages/home/components/welcome_text.dart';
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
              child: WelcomeText(name: faker.person.firstName(),)
            ),
            
            
          ],
        ),
      ),
    );
  }
}
