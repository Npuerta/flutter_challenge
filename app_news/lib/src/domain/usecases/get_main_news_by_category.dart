import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetMainNewsByCategory {
final NewsRepository newsRepository;
  GetMainNewsByCategory(this.newsRepository);

    Future<TopHeadlinesEntitie> call(String category) {
    NewsApiParameters snap = NewsApiParameters(category: category);
    return newsRepository.getTopHeadLines(snap);
  }
}