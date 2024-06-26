import 'package:app_news/global/api/custom_api_client.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/data/datasources/firebase_api.dart';
import 'package:app_news/src/data/datasources/news_api.dart';
import 'package:app_news/src/data/datasources/weather_api.dart';
import 'package:app_news/src/data/models/autocom_collection.dart';
import 'package:app_news/src/data/models/everything.dart';
import 'package:app_news/src/data/models/headlines.dart';
import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:app_news/src/data/models/top_headlines.dart';
import 'package:app_news/src/data/models/weather.dart';
import 'package:app_news/src/domain/entities/autocom_collection_entitie.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/entities/headlines_entitie.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/entities/weather_entitie.dart';
import 'package:app_news/src/domain/mapped/Autocom_collection_mapped.dart';
import 'package:app_news/src/domain/mapped/everything_mapped.dart';
import 'package:app_news/src/domain/mapped/headlines_mapped.dart';
import 'package:app_news/src/domain/mapped/top_headlines_mapped.dart';
import 'package:app_news/src/domain/mapped/weather_mapped.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:get_it/get_it.dart';

class  NewsRepositoryImpl extends NewsRepository{
late final NewsApi newsApi;
late final FirebaseApi firebaseApi;
late final WeatherApi weatherApi;

NewsRepositoryImpl(){
  newsApi = NewsApi(GetIt.I<CustomApiClient>());
  weatherApi = WeatherApi(GetIt.I<CustomApiClient>());
  firebaseApi = FirebaseApi();
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

  @override
  Future<AutocomCollectionEntitie> getOptions(String collectionName)async {
    final docs = await firebaseApi.getWords(collectionName);
  try {
    AutocomCollection result = AutocomCollection.fromData(docs);
    AutocomCollectionEntitie res = AutocomCollectionMapped.mapped(result);
    return res;
      
  } catch(e,s) {
      throw CustomException(
        messageUser: 'error consultando getOptions ${collectionName}',
        internalErrorCode: '104',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        data: docs.toString(),
      );
    }
  }

  @override
  Future<WeatherEntitie> getWeatherByCity(String city, String language) async {
    final response = await weatherApi.getWeather(city, language);
     try {
         Weather result = Weather.fromJson(response);
         WeatherEntitie res = WeatherMapped.mapped(result);
       return res;
    } catch (e,s) {
      throw CustomException(
        messageUser: 'error consultando getWeatherByCity ${city}',
        internalErrorCode: '105',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        data: response.toString(),
      );
    }
  }



}