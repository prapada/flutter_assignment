import 'package:flutter_assignment/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_assignment/features/product/domain/entities/product.dart';
import 'package:flutter_assignment/features/product/domain/entities/product_detail.dart';
import 'package:flutter_assignment/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts({int skip = 0, int limit = 20}) async {
    final productModels = await remoteDataSource.getProducts(skip: skip, limit: limit);
    return productModels;
  }

  @override
  Future<ProductDetail> getProductById(int id) async {
    return remoteDataSource.getProductById(id);
  }

  @override
  Future<List<Product>> searchProducts(String query) {
    return remoteDataSource.searchProducts(query);
  }
}
