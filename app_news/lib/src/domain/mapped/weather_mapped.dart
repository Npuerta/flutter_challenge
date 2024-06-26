import 'package:app_news/src/data/models/weather.dart';
import 'package:app_news/src/domain/entities/weather_entitie.dart';
import 'package:app_news/src/domain/mapped/current_mapped.dart';
import 'package:app_news/src/domain/mapped/location_mapped.dart';

class WeatherMapped {

static WeatherEntitie mapped(Weather weather)=> WeatherEntitie(
  current: CurrentMapped.mapped(weather.current),
  location: LocationMapped.mapped(weather.location)
);

}