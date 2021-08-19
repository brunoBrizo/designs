import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  ThemeProvider(int theme) {
    switch (theme) {
      case 1: //light
        this._darkTheme = false;
        this._customTheme = false;
        this._currentTheme =
            ThemeData.light().copyWith(accentColor: Colors.pink);
        break;
      case 2: //dark
        this._darkTheme = true;
        this._customTheme = false;
        this._currentTheme =
            ThemeData.dark().copyWith(accentColor: Colors.pink);
        break;
      case 3: //custom
        this._darkTheme = false;
        this._customTheme = true;
        this._currentTheme = ThemeData.light();
        break;
      default:
        this._darkTheme = false;
        this._customTheme = true;
        this._currentTheme =
            ThemeData.light().copyWith(accentColor: Colors.pink);
    }
  }

  bool get darkTheme => this._darkTheme;
  set darkTheme(bool isDark) {
    this._darkTheme = isDark;
    this._customTheme = false;

    if (isDark) {
      _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
    }
    notifyListeners();
  }

  bool get customTheme => this._customTheme;
  set customTheme(bool isCustom) {
    this._customTheme = isCustom;
    this._darkTheme = false;

    if (isCustom) {
      _currentTheme = ThemeData.dark().copyWith(
          accentColor: Color(0xff48A0EB),
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202B),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
    }
    notifyListeners();
  }

  ThemeData get currentTheme => this._currentTheme;
}
