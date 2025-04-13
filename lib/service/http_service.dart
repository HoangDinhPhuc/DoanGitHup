import 'dart:io';

import 'package:dio/dio.dart';

class FetchClient {
  Dio dio = Dio();
  String domain = 'https://img.otruyenapi.com/';
  Future<Response> getData(
      {String? domainApp,
      required String path,
      Map<String, dynamic>? queryParameters}) async {
    if (await hasInternet()) {
      try {
        Response<dynamic> result = await dio.get(
          (domainApp ?? domain) + path,
          queryParameters: queryParameters,
        );
        return result;
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: "Vãi cước đéo có mạng :v",
          requestOptions: RequestOptions());
    }
  }

  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
