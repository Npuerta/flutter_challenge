import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetMainNewsByCountry {
  final NewsRepository newsRepository;

  GetMainNewsByCountry(this.newsRepository);

  Future<TopHeadlinesEntitie> call(String country) {
    NewsApiParameters snap = NewsApiParameters(country: country);
    return newsRepository.getTopHeadLines(snap);
  }
}
