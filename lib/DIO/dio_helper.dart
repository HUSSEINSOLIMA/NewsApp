// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';

class dioHelper {
  static Dio? dio;

  dioHelper(BaseOptions baseOptions);

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData(
      {String? url, Map<String, dynamic>? query}) async {
    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }
}
