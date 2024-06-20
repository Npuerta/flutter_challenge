import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/headlines_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_sources_by_country.dart';
import 'package:flutter/material.dart';

class SourcesNewsController extends ChangeNotifier {
  ControllerStates _state = ControllerStates.initial;
  late HeadlinesEntitie _headlinesEntitie;

  late final NewsRepository _newsRepository;
  late final GetSourcesByCountry _getSourcesByCountry;
  CustomException? error;

  SourcesNewsController(this._newsRepository) {
    _getSourcesByCountry = GetSourcesByCountry(_newsRepository);
  }

  ControllerStates get state => _state;
  HeadlinesEntitie get headlinesEntitie => _headlinesEntitie;

  Future<void> getSourcesByCountry(String? country) async {
    try {
      if (country == null) return;
      _state = ControllerStates.loading;
      notifyListeners();

      _headlinesEntitie = await _getSourcesByCountry.call(country);
      
      _state = ControllerStates.success;
      notifyListeners();
    } on CustomException catch (e) {
      error = e;
      _state = ControllerStates.error;
      notifyListeners();
    }
  }
}
