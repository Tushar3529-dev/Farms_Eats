import 'package:flutter/material.dart';

class STOutLinedButtonTheme {
  STOutLinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonThemeData =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        ),
      );

  static OutlinedButtonThemeData darkOutlinedButtonThemeData =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          side: const BorderSide(color: Colors.blueAccent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        ),
      );
}