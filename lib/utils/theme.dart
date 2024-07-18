import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).bodyMedium,
        titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).titleLarge,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.0),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.amber)
          .copyWith(surface: Colors.white),
    );
  }
}
