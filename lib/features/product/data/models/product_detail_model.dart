import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_assignment/features/product/domain/entities/product_detail.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel extends ProductDetail {
  const ProductDetailModel({
    required super.id,
    required super.title,
    required super.description,
    required super.thumbnail,
    required super.images,
    required super.price,
    required super.discountPercentage,
    required super.category,
    required super.rating,
    required super.stock,
    required super.brand,
    required super.availabilityStatus,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
}
