import 'package:flutter_assignment/features/product/domain/entities/product.dart';
import 'package:flutter_assignment/features/product/domain/entities/product_detail.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({int skip = 0, int limit = 20});

  Future<ProductDetail> getProductById(int id);

  Future<List<Product>> searchProducts(String query);
}