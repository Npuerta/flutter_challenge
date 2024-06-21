import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_news_by_source.dart';
import 'package:flutter/material.dart';

class SearchBySourceController extends ChangeNotifier {
  ControllerStates _state = ControllerStates.initial;
  late EverythingEntitie _everythingEntitie;

  late final NewsRepository _newsRepository;
  late final GetNewsBySource _getNewsBySource;
  CustomException? error;

  SearchBySourceController(this._newsRepository) {
    _getNewsBySource = GetNewsBySource(_newsRepository);
  }

  ControllerStates get state => _state;
  EverythingEntitie get everythingEntitie => _everythingEntitie;

  Future<void> getNewsBySource(
      String sourceId, String sortBy, String pageSize) async {
    try {
      _state = ControllerStates.loading;
      notifyListeners();

      _everythingEntitie = await _getNewsBySource.call(sourceId, sortBy, pageSize);

      _state = ControllerStates.success;
      notifyListeners();
    } on CustomException catch (e) {
      error = e;
      _state = ControllerStates.error;
      notifyListeners();
    }
  }
}
