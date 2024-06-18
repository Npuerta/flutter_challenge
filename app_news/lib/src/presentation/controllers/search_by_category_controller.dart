
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_main_news_by_category.dart';

import 'package:flutter/material.dart';

class SearchByCategoryController extends ChangeNotifier {

  late TopHeadlinesEntitie _topHeadlinesEntitie;
  ControllerStates _state = ControllerStates.initial;

  late final NewsRepository _newsRepository;
  late final GetMainNewsByCategory _getMainNewsByCategory;
  CustomException? error;

SearchByCategoryController(this._newsRepository){
_getMainNewsByCategory = GetMainNewsByCategory(_newsRepository);
}

ControllerStates get state => _state;
TopHeadlinesEntitie get topHeadlinesEntitie => _topHeadlinesEntitie;

Future<void> getSearchByText(String category) async {
  try {
   _state= ControllerStates.loading;
    notifyListeners();

_topHeadlinesEntitie = await _getMainNewsByCategory.call(category);

    _state= ControllerStates.success;
    notifyListeners();
    
  } on CustomException catch (e) {
    error =e;
    _state= ControllerStates.error;
    notifyListeners();
  }
}


}