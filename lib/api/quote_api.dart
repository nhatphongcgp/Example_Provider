import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class QuoteApi {
  final Dio _dio = Dio();
  final String _url = "https://zenquotes.io/api/random";

  Future<dynamic> fetchDataFromHttp() async {
    try {
      Response response = await _dio.get(_url);
      return response.data;
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
