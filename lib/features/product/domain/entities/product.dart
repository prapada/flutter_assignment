import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String thumbnail;
  final double price;
  final String category;
  final double rating;

  const Product({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.category,
    required this.rating,
  });

  @override
  List<Object> get props => [id, title, thumbnail, price, category, rating];
}