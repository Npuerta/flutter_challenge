import 'package:app_news/global/constants.dart';
import 'package:flutter/material.dart';

class SelectCategoryState extends ChangeNotifier {
  Categories _state = Categories.topnews;

  Categories get state => _state;

  void setState(Categories input) {
    _state = input;
    print(' se selecciono:: ${input.name}');
    notifyListeners();
  }
}
