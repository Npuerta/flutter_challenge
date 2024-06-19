import 'package:app_news/global/constants.dart';
import 'package:flutter/material.dart';

class SelectCountryState extends ChangeNotifier {
  Country _state = Country.co;
  Country get state => _state;
  
  void setState(Country input) {
    _state = input;
    print(' se busca noticias del pais ::  ${input.name}');
    notifyListeners();
  }
}
