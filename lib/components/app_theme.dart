import 'package:flutter/material.dart';

final primaryColor = Colors.orange;
final primaryColorDark = Colors.deepOrange;
final primaryColorLight = Colors.orangeAccent;
final inputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: primaryColorLight),
);

ThemeData appTheme() => ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      accentColor: primaryColor,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: primaryColorDark),
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder:inputBorder,
          errorBorder:inputBorder,
          disabledBorder:inputBorder,
          focusedErrorBorder: inputBorder,
          border: inputBorder,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          alignLabelWithHint: true),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        buttonColor: primaryColor,
        splashColor: primaryColorLight,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
