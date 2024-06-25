import 'package:app_news/src/domain/entities/autocom_collection_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';

class GetOptionInFirebase {
final NewsRepository newsRepository;
GetOptionInFirebase(this.newsRepository);

Future<AutocomCollectionEntitie> call(String collectionName){
  return newsRepository.getOptions(collectionName);
}
}