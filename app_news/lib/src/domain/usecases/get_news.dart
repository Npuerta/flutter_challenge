
import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetNews{
  final NewsRepository newsRepository;
  GetNews(this.newsRepository);

  Future<EverythingEntitie> call(NewsApiParameters nap){
    return newsRepository.getEveryThing(nap);
  }

  // duda de implementacion.
  // Future<EverythingEntitie> callBySearchIn(String searchText, String searchIn) {
  //   NewsApiParameters snap =
  //       NewsApiParameters(qSearch: searchText, searchIn: searchIn);
  //   return newsRepository.getEveryThing(snap);
  // }
}