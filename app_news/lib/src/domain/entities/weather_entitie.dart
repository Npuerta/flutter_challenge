import 'package:app_news/src/domain/entities/current_entitie.dart';
import 'package:app_news/src/domain/entities/location_entitie.dart';

class WeatherEntitie {
  final LocationEntitie location;
  final CurrentEntitie current;

    WeatherEntitie({
        required this.location,
        required this.current,
    });

}