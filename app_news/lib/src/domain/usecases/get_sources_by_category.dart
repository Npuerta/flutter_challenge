import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/headlines_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetSourcesByCategory {
  final NewsRepository newsRepository;

  GetSourcesByCategory(this.newsRepository);

  Future<HeadlinesEntitie> call(String category) {
    NewsApiParameters snap = NewsApiParameters(category: category);
    return newsRepository.getHeadlinesSources(snap);
  }
}
