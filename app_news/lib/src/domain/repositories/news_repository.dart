import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/autocom_collection_entitie.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/entities/headlines_entitie.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/entities/weather_entitie.dart';

abstract class NewsRepository{
  Future<EverythingEntitie> getEveryThing(NewsApiParameters nap);
  Future<TopHeadlinesEntitie> getTopHeadLines(NewsApiParameters nap);
  Future<HeadlinesEntitie> getHeadlinesSources(NewsApiParameters nap);
  Future<AutocomCollectionEntitie> getOptions(String collectionName);
  Future<WeatherEntitie> getWeatherByCity(String city, String language);

}