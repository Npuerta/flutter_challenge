import 'package:app_news/src/data/models/location.dart';
import 'package:app_news/src/domain/entities/location_entitie.dart';

class LocationMapped {

  static  mapped(Location location)=>LocationEntitie(
    country: location.country,
    localtime: location.localtime,
    name: location.name,
    region: location.region
  );
}