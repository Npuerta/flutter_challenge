import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetSearchByText {

final NewsRepository newsRepository;
GetSearchByText(this.newsRepository);

Future<EverythingEntitie> call(String searchText){
  NewsApiParameters snap = NewsApiParameters(qSearch: searchText);
  return newsRepository.getEveryThing(snap);
}
}