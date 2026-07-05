part of 'product_list_bloc.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();
  
  @override
  List<Object> get props => [];
}

final class ProductListInitial extends ProductListState {}

final class ProductListLoading extends ProductListState {
  final List<Product>? products;
  final bool hasReachedMax;

  const ProductListLoading({ 
    this.products, 
    this.hasReachedMax = false
  });

  @override
  List<Object> get props => [products ?? [], hasReachedMax];
}

final class ProductListLoaded extends ProductListState {
  final List<Product> products;
  final bool hasReachedMax;

  const ProductListLoaded(
    this.products, {
    this.hasReachedMax = false,
  });

  @override
  List<Object> get props => [products, hasReachedMax];
}

final class ProductListError extends ProductListState {
  final String message;

  const ProductListError(this.message);

  @override
  List<Object> get props => [message];
}
