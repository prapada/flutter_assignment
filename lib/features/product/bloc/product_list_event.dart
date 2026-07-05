part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

final class LoadProducts extends ProductListEvent {}

final class LoadMoreProducts extends ProductListEvent {}
