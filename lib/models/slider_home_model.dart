import 'package:flutter/material.dart';

class SliderHomeModel with ChangeNotifier {
  PageController _controller = PageController(initialPage: 0);

  set controller(PageController valor) {
    this._controller = valor;
  }

  PageController get controller => this._controller;

  int _currentPage = 0;

  int get currentPage => this._currentPage;

  set currentPage(int pagina) {
    this._currentPage = pagina;
    notifyListeners();
  }
}
