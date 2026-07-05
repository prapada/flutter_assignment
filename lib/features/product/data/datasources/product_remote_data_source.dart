import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/network/api_endpoints.dart';
import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:flutter_assignment/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts({int skip = 0, int limit = 20});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DioClient dioClient;

  ProductRemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<ProductModel>> getProducts({int skip = 0, int limit = 20}) async {
    final response = await dioClient.dio.get(
      ApiEndpoints.products,
      queryParameters: {
        'skip': skip,
        'limit': limit,
      },
    );
    
    if (response.statusCode == 200) {
      final List<dynamic> productsJson = response.data['products'];
      return productsJson
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      );
    }
  }
}
