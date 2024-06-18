
import 'package:dio/dio.dart';

class CustomInterceptorsApi extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('---->REQUEST [${options.method}] ====> PATH ::: ${options.path} ');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('--- :P --->RESPONSE [${response.statusCode}] ====> PATH ::: ${response.requestOptions.path} ');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('--- *-* -->ERROR [${err.error.toString() }] ====> PATH ::: ${err.requestOptions.path} ');
    super.onError(err, handler);
  }

}