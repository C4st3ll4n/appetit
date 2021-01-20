import 'package:fappetite/ui/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';


import 'factories/factories.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Apettit",
      initialRoute: "/login",
      theme: appTheme(),
      getPages: [
        GetPage(name: "/login", page: makeLoginPage),
        GetPage(
          name: "/orders",
          page: makeHomePage,
        ),
      ],
    );
  }
}
