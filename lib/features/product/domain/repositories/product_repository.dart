import 'package:flutter_assignment/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({int skip = 0, int limit = 20});
}