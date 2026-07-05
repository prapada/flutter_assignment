import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_assignment/features/product/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.price,
    required super.category,
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
