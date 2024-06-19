import 'package:flutter/material.dart';

class SearchState extends ChangeNotifier {
  String _state = '';

  String get state => _state;

  void setState(String input) {
    _state = input;
    print(' se busca con:: $input');
    notifyListeners();
  }
}
