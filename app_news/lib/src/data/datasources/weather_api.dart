import 'package:app_news/global/api/custom_api_client.dart';
import 'package:app_news/global/constants.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:dio/dio.dart';

class WeatherApi {
  late final CustomApiClient apiClient;
  WeatherApi(this.apiClient);
  final Runes errorEmo = Runes('\u{1F915}');

  Future<Map<String, dynamic>> getWeather(String city, String language) async {
    try {
      String url = '${UrlApiWeather}&q=${city}&lang=${language}';
      final response = await apiClient.get(url);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e, s) {
      throw CustomException(
        messageUser:
            'Error en Weather_api ::: getWeather!!! ${String.fromCharCodes(errorEmo)}',
        internalErrorCode: '21-${e.error.hashCode}',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        httpErrorCode: e.response!.statusCode,
      );
    }
  }
}
