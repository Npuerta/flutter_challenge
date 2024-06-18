

import 'package:app_news/global/api/custom_interceptors_api.dart';
import 'package:dio/io.dart';

class CustomApiClient extends DioForNative {
  CustomApiClient([super.options]){
    interceptors.add(CustomInterceptorsApi());
  }

}