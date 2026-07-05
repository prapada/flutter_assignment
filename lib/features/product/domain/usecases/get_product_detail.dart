import 'package:flutter_assignment/features/product/domain/entities/product_detail.dart';
import 'package:flutter_assignment/features/product/domain/repositories/product_repository.dart';

class GetProductDetail {
  final ProductRepository repository;

  GetProductDetail(this.repository);

  Future<ProductDetail> call(int id) => repository.getProductById(id);
}
