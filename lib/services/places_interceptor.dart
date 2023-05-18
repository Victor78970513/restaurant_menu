import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  final accessToken =
      "pk.eyJ1Ijoid2lzY28xMiIsImEiOiJjbGhncHk1dWwwYXIxM2NwODk3cHEyemc5In0.lestajmAjlTu3qsjw-gNsg";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'access_token': accessToken,
      'language': 'es',
    });
    super.onRequest(options, handler);
  }
}
