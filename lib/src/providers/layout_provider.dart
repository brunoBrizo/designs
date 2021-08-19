import 'package:designs/src/pages/slide_show_page.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier {
  Widget _currentPage = SlideShowPage();

  Widget get currentPage => this._currentPage;
  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }
}
