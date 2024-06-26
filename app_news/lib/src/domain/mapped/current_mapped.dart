
import 'package:app_news/src/data/models/current.dart';
import 'package:app_news/src/domain/entities/current_entitie.dart';
import 'package:app_news/src/domain/mapped/condition_mapped.dart';

class CurrentMapped {

  static CurrentEntitie mapped(Current current)=> CurrentEntitie(
    cloud: current.cloud,
    humidity: current.humidity,
    tempC: current.tempC,
    tempF: current.tempF,
    windDegree: current.windDegree,
    windKph: current.windKph,
    windMph: current.windMph,
    condition: ConditionMapped.mapped(current.condition),
  );
}