import 'package:dio/dio.dart';

class DioProvider {
  static late Dio _dio;
  static init() {
    _dio = Dio(BaseOptions(baseUrl: "https://codingarabic.online/api/"));
  }

  static Future<Response> get({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return _dio.get(
      path,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  static Future<Response> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return _dio.put(
      path,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return _dio.delete(
      path,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }
}
