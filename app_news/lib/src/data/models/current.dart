import 'package:app_news/src/data/models/condition.dart';

class Current {
    final double tempC;
    final double tempF;
    final Condition condition;
    final double windMph;
    final double windKph;
    final int windDegree;
    final int humidity;
    final int cloud;

    Current({
        required this.tempC,
        required this.tempF,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.humidity,
        required this.cloud,
    });

    factory Current.fromJson(Map<String,dynamic> json)=> Current(
     cloud:  json['cloud'],
     humidity:  json['humidity'],
     tempC:  json['temp_c'] ?? 0.0,
     tempF:  json['temp_f'] ?? 0.0,
     windDegree: json['wind_degree'],
     windKph:  json['wind_kph'] ??0.0,
     windMph:  json['wind_mph'] ?? 0.0,
     condition:  Condition.fromJson(json['condition']),
    );

}