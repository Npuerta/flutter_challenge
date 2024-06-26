import 'package:app_news/src/domain/entities/weather_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetWeatherCity {

final NewsRepository newsRepository;

GetWeatherCity(this.newsRepository);

Future<WeatherEntitie> call(String city, String language){
  return newsRepository.getWeatherByCity(city, language);
}

}