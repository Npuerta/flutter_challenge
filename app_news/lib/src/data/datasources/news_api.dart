import 'package:app_news/global/api/custom_api_client.dart';
import 'package:app_news/global/build_url_new_api.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/data/models/news_api_parameters.dart';
import 'package:dio/dio.dart';

class NewsApi {
late final CustomApiClient apiClient;
NewsApi(this.apiClient);

final Runes errorEmo = Runes('\u{1F915}');
final BuildUrlNewApi builUrl = BuildUrlNewApi();
 
 Future<Map<String,dynamic>> getEveryThing(NewsApiParameters nap) async {
  try {
    String url= builUrl.getUrl(nap, 'everything');
      final response = await apiClient.get(url);
      return response.data as Map<String, dynamic>;
  } on DioException catch (e,s) {
     throw CustomException(
        messageUser:'Error en news_api ::: getEveryThing !!! ${String.fromCharCodes(errorEmo)}',
        internalErrorCode: '01-${e.error.hashCode}',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        httpErrorCode: e.response!.statusCode,
      );
  }

 }

 Future<Map<String,dynamic>> getHeadLines(NewsApiParameters nap) async {
  try {
    String url= builUrl.getUrl(nap, 'top-headlines');
      final response = await apiClient.get(url);
      return response.data as Map<String, dynamic>;
  } on DioException catch (e,s) {
     throw CustomException(
        messageUser:'Error en news_api ::: getHeadLines !!! ${String.fromCharCodes(errorEmo)}',
        internalErrorCode: '02-${e.error.hashCode}',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        httpErrorCode: e.response!.statusCode,
      );
  }

 }


 Future<Map<String,dynamic>> getSources(NewsApiParameters nap) async {
  try {
    String url= builUrl.getUrl(nap,'top-headlines/sources');
      final response = await apiClient.get(url);
      return response.data as Map<String, dynamic>;
  } on DioException catch (e,s) {
     throw CustomException(
        messageUser:'Error en news_api ::: getSources !!! ${String.fromCharCodes(errorEmo)}',
        internalErrorCode: '03-${e.error.hashCode}',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        httpErrorCode: e.response!.statusCode,
      );
  }


  

 }










  
}