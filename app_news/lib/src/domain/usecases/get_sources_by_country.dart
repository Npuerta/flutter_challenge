import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/headlines_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetSourcesByCountry {
  final NewsRepository newsRepository;

  GetSourcesByCountry(this.newsRepository);

  Future<HeadlinesEntitie> call(String country) {
    NewsApiParameters snap = NewsApiParameters(country: country);
    return newsRepository.getHeadlinesSources(snap);
  }
}
