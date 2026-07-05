import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient._internal(this.dio);

  static DioClient create() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    ]);

    return DioClient._internal(dio);
  }
}