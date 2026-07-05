part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

final class LoadProductDetail extends ProductDetailEvent {
  final int id;

  const LoadProductDetail(this.id);

  @override
  List<Object> get props => [id];
}
