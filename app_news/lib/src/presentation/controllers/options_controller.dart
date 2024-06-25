import 'package:app_news/global/constants.dart';
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/autocom_collection_entitie.dart';
import 'package:app_news/src/domain/entities/autocom_data_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_option_in_firebase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_news/global/local_search_option.dart';

class OptionsController extends ChangeNotifier {
  ControllerStates _state = ControllerStates.initial;
  late final AutocomCollectionEntitie _autocomCollectionEntitie;
  List<String> _options = LocalSearchOption().options;

  

  late final NewsRepository _newsRepository;
  late final GetOptionInFirebase _getOptionInFirebase;
  CustomException? error;

  OptionsController(this._newsRepository) {
    _getOptionInFirebase = GetOptionInFirebase(_newsRepository);
  }

  ControllerStates get state => _state;
  AutocomCollectionEntitie get autocomCollectionEntitie =>
      _autocomCollectionEntitie;

   List<String> get options => _options;    

  Future<void> getOptionsAuto() async {
    try {
      _state = ControllerStates.loading;
      notifyListeners();

      _autocomCollectionEntitie =
          await _getOptionInFirebase.call(colletionAutocompl);

      _state = ControllerStates.success;
      notifyListeners();
    } on CustomException catch (e) {
      error = e;
      _state = ControllerStates.error;
      notifyListeners();
    }
  }


set optionsByCountry(Country country) {
    if (country == Country.us || country == Country.ca) {
      AutocomDataEntitie data = autocomCollectionEntitie.data
          .firstWhere((aut) => aut.language == 'en');
    
      _options = data.options;
    }

    if (country == Country.co) {
      AutocomDataEntitie data = autocomCollectionEntitie.data
          .firstWhere((aut) => aut.language == 'es');
       _options = data.options;
    }
   
  }
}
