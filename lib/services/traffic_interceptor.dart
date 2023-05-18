import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  final accessToken =
      "pk.eyJ1Ijoid2lzY28xMiIsImEiOiJjbGhncHk1dWwwYXIxM2NwODk3cHEyemc5In0.lestajmAjlTu3qsjw-gNsg";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'access_token': accessToken,
    });

    super.onRequest(options, handler);
  }
}
