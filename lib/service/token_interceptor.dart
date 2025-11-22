import 'package:dio/dio.dart';

import 'api_key.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $API_KEY';
    super.onRequest(options, handler);
  }
}
