import 'package:app_news/global/constants.dart';
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/weather_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_weather_city.dart';
import 'package:flutter/material.dart';

class WeatherCityController extends ChangeNotifier {
  late final NewsRepository _newsRepository;
  late final GetWeatherCity _getWeatherCity;
  late WeatherEntitie _weatherEntitie;
  CustomException? error;

  ControllerStates _state = ControllerStates.initial;

  WeatherCityController(this._newsRepository) {
    _getWeatherCity = GetWeatherCity(_newsRepository);
  }

  ControllerStates get state => _state;
  WeatherEntitie get weatherEntitie => _weatherEntitie;

  Future<void> getWeatherCity(Country contry) async {
    try {
      _state = ControllerStates.loading;
      notifyListeners();

      String city = 'washington';
      String language = 'en';

      if (contry == Country.co) {
        city = 'Medellin';
        language = 'es';
      } else if (contry == Country.ca) {
        city = 'Ontario';
      }

      _weatherEntitie = await _getWeatherCity.call(city, language);

      _state = ControllerStates.success;
      notifyListeners();
    } on CustomException catch (e) {
      error = e;
      _state = ControllerStates.error;
      notifyListeners();
    }
  }
}
