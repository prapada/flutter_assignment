import 'package:equatable/equatable.dart';

class ProductDetail extends Equatable {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final List<String> images;
  final double price;
  final double discountPercentage;
  final String category;
  final double rating;
  final int stock;
  final String brand;
  final String availabilityStatus;

  const ProductDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.images,
    required this.price,
    required this.discountPercentage,
    required this.category,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.availabilityStatus,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        thumbnail,
        images,
        price,
        discountPercentage,
        category,
        rating,
        stock,
        brand,
        availabilityStatus,
      ];
}
