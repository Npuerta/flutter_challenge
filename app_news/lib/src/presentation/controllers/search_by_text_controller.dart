
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_search_by_text.dart';

import 'package:flutter/material.dart';

class SearchByTextController extends ChangeNotifier {

  late EverythingEntitie _everythingEntitie;
  ControllerStates _state = ControllerStates.initial;

  late final NewsRepository _newsRepository;
  late final GetSearchByText _getSearchByText;
  CustomException? error;

SearchByTextController(this._newsRepository){
_getSearchByText = GetSearchByText(_newsRepository);
}

ControllerStates get state => _state;
EverythingEntitie get everythingEntitie => _everythingEntitie;

Future<void> getSearchByText(String? searchText) async {
  try {
     if (searchText==null) return;
   _state= ControllerStates.loading;
    notifyListeners();

_everythingEntitie = await _getSearchByText.call(searchText);

    _state= ControllerStates.success;
    notifyListeners();
    
  } on CustomException catch (e) {
    error =e;
    _state= ControllerStates.error;
    notifyListeners();
  }
}


}