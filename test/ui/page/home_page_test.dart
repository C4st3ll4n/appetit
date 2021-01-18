import 'dart:async';

import 'package:faker/faker.dart';
import 'package:fappetite/ui/pages/home/home_page.dart';
import 'package:fappetite/ui/pages/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:fappetite/ui/pages/pages.dart';

void main() {
  HomePresenter presenter;
  StreamController<String> navigateToController;
  StreamController<String> searchController;
  StreamController<String> searchErrorController;
  StreamController<bool> isLoadingController;

  void _initStreams() {
    isLoadingController = StreamController();
    navigateToController = StreamController();
    searchController = StreamController();
    searchErrorController = StreamController();
  }

  void _closeStreams() {
    isLoadingController.close();
    navigateToController.close();
    searchController.close();
    searchErrorController.close();
  }

  void _mockStreams() {
   

    when(presenter.isLoadingStream)
        .thenAnswer((_) => isLoadingController.stream);

    when(presenter.searchErrorStream)
        .thenAnswer((_) => searchErrorController.stream);

    when(presenter.navigateToStream)
        .thenAnswer((_) => navigateToController.stream);

    when(presenter.searchStream)
        .thenAnswer((_) => searchController.stream);
  }

  setUp(() {});

  tearDown(
    () {
      _closeStreams();
    },
  );

  Future<void> loadPage(WidgetTester tester) async {
    presenter = HomePresenterSpy();
    _initStreams();
    _mockStreams();
    final loginPage = GetMaterialApp(
    
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomePage(
            presenter: presenter,
          ),
        ),
        GetPage(
          name: "/fake_page",
          page: () => Scaffold(
            body: Text("fake page"),
          ),
        ),
      ],
    );
    await tester.pumpWidget(loginPage);
  }

  testWidgets(
    "Shoud load with correct initial state",
    (tester) async {
      await loadPage(tester);

      final searchTextChildren = find.descendant(
        of: find.byIcon(Icons.search),
        matching: find.byType(IconData),
      );

      expect(searchTextChildren, findsOneWidget,
          reason: "When a TextFormField has only one text"
              " child, means it has no errors, since one of the child is"
              " always the label text");

      expect(find.byType(CircularProgressIndicator), findsNothing);
    },
  );

  
}

class HomePresenterSpy extends Mock implements HomePresenter {}
