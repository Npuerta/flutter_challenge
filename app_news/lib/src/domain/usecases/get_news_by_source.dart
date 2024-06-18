import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetNewsBySource {
  final NewsRepository newsRepository;
  GetNewsBySource(this.newsRepository);

  Future<EverythingEntitie> call(
      String sourceId, String sortBy, String pageSize) {
    NewsApiParameters snap = NewsApiParameters(
        sources: sourceId, sortBy: sortBy, pageSize: pageSize);
    return newsRepository.getEveryThing(snap);
  }
}
