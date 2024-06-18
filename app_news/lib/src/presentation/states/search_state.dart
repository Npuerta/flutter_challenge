import 'package:flutter/material.dart';

class SearchState extends ChangeNotifier {
  String _state = '';

  String get state => _state;

  void setState(String input) {
    String withOutWhiteSpaces = input.replaceAll(' ', '+');
    _state = withOutWhiteSpaces;
    print(' se busca con:: $input');
    notifyListeners();
  }
}
