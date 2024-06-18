import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetSearchWithSearchin{
  final NewsRepository newsRepository;
  GetSearchWithSearchin(this.newsRepository);


  Future<EverythingEntitie> call(String searchText, String searchIn) {
     NewsApiParameters snap = NewsApiParameters(qSearch: searchText, searchIn: searchIn);
     return newsRepository.getEveryThing(snap);
  }
}