import 'package:app_news/src/domain/entities/condition_entitie.dart';

class CurrentEntitie {

  final double tempC;
    final double tempF;
    final ConditionEntitie condition;
    final double windMph;
    final double windKph;
    final int windDegree;
    final int humidity;
    final int cloud;

    CurrentEntitie({
        required this.tempC,
        required this.tempF,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.humidity,
        required this.cloud,
    });

}