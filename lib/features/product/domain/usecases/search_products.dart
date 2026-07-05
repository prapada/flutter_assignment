import 'package:flutter_assignment/features/product/domain/entities/product.dart';
import 'package:flutter_assignment/features/product/domain/repositories/product_repository.dart';

class SearchProducts {
  final ProductRepository repository;

  SearchProducts(this.repository);

  Future<List<Product>> call(String query) {
    return repository.searchProducts(query);
  }
}
