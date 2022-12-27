import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  bool _isDarkTheme = true;

  ThemeMode currentTheme() {
    if (_isDarkTheme) {
      return ThemeMode.dark;
    }

    return ThemeMode.light;
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      // iconTheme: IconThemeData(color: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blueAccent,
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
        ),
      ),
      cardColor: Color(0xFF1A191D),
      dividerColor: Colors.grey[600]);

  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFeeeeee),
      primaryColor: Color(0xFFeeeeee),
      appBarTheme:
          AppBarTheme(backgroundColor: Color.fromARGB(255, 149, 149, 149), elevation: 0),
      // iconTheme: IconThemeData(color: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blueAccent,
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black));
  //current theme
  //dark theme
  //light theme
  //toggle theme
}
