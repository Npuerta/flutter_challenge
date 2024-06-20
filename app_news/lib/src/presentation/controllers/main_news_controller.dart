
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_main_news_by_country.dart';
import 'package:flutter/material.dart';

class MainNewsController extends ChangeNotifier {

  late TopHeadlinesEntitie _topHeadlinesEntitie;
  ControllerStates _state = ControllerStates.initial;

  late final NewsRepository _newsRepository;
  late final GetMainNewsByCountry _getMainNewsByCountry;
  
  CustomException? error;

MainNewsController(this._newsRepository){
_getMainNewsByCountry = GetMainNewsByCountry(_newsRepository);
}

ControllerStates get state => _state;
TopHeadlinesEntitie get topHeadlinesEntitie => _topHeadlinesEntitie;


Future<void> getMainNews(String? country) async {
  try {
    if (country==null) return;
   _state= ControllerStates.loading;
    notifyListeners();

_topHeadlinesEntitie = await _getMainNewsByCountry.call(country);

    _state= ControllerStates.success;
    notifyListeners();
    
  } on CustomException catch (e) {
    error =e;
    _state= ControllerStates.error;
    notifyListeners();
  }
}


}