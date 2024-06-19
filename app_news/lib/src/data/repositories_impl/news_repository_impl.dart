import 'package:app_news/global/api/custom_api_client.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/data/datasources/news_api.dart';
import 'package:app_news/src/data/models/everything.dart';
import 'package:app_news/src/data/models/headlines.dart';
import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/data/models/top_headlines.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/entities/headlines_entitie.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/mapped/everything_mapped.dart';
import 'package:app_news/src/domain/mapped/headlines_mapped.dart';
import 'package:app_news/src/domain/mapped/top_headlines_mapped.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:get_it/get_it.dart';

class  NewsRepositoryImpl extends NewsRepository{
late final NewsApi newsApi;

NewsRepositoryImpl(){
  newsApi = NewsApi(GetIt.I<CustomApiClient>());
}

  @override
  Future<EverythingEntitie> getEveryThing(NewsApiParameters nap) async {
    final response = await newsApi.getEveryThing(nap);
    
    try {
       Everything result = Everything.fromJson(response);
       EverythingEntitie res = EverythingMapped.mapped(result);
       return res;
    } catch (e,s) {
      throw CustomException(
        messageUser: 'error consultando getEveryThing ${nap.qSearch}',
        internalErrorCode: '101',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        data: response.toString(),
      );
    }
  }

    @override
  Future<TopHeadlinesEntitie> getTopHeadLines(NewsApiParameters nap) async {
      final response =  await newsApi.getHeadLines(nap);
     try {
      TopHeadlines result = TopHeadlines.fromJson(response);
       TopHeadlinesEntitie res = TopHeadlinesMapped.mapped(result);
       return res;
    } catch (e,s) {
      throw CustomException(
        messageUser: 'error consultando getTopHeadLines ${nap.qSearch}',
        internalErrorCode: '102',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        data: response.toString(),
      );
    }
  }
  

  @override
  Future<HeadlinesEntitie> getHeadlinesSources(NewsApiParameters nap) async {
    final response = await newsApi.getSources(nap);
     try {
        Headlines result = Headlines.fromJson(response);
        HeadlinesEntitie res = HeadlinesMapped.mapped(result);
       return res;
    } catch (e,s) {
      throw CustomException(
        messageUser: 'error consultando getHeadlinesSources ${nap.qSearch}',
        internalErrorCode: '103',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        data: response.toString(),
      );
    }
  }

}