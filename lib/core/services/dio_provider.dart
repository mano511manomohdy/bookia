import 'package:dio/dio.dart';

class DioProvider {
  static late Dio _dio;
  static init() {
    _dio = Dio(BaseOptions(baseUrl: "https://codingarabic.online/api/"));
  }

  Future<Response> get({
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

  Future<Response> post({
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

  Future<Response> put({
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

  Future<Response> delete({
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
}
