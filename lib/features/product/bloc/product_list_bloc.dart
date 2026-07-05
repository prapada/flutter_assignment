import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/product/domain/entities/product.dart';
import 'package:flutter_assignment/features/product/domain/usecases/get_products.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProducts getProducts;
  static const int _limit = 20;
  int _skip = 0;
  bool _hasReachedMax = false;

  ProductListBloc(this.getProducts) : super(ProductListInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadMoreProducts>(_onLoadMoreProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductListState> emit,
  ) async {
    _skip = 0;
    _hasReachedMax = false;
    emit(ProductListLoading());
    try {
      final products = await getProducts(
        skip: _skip, 
        limit: _limit
      );

      _skip += _limit;
      _hasReachedMax = products.length < _limit;

      emit(
        ProductListLoaded(
          products, 
          hasReachedMax: _hasReachedMax
        ),
      );
    } catch (e) {
      emit(
        ProductListError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadMoreProducts(
    LoadMoreProducts event,
    Emitter<ProductListState> emit,
  ) async {
    if (state is ProductListLoading || _hasReachedMax) return;

    final currentState = state as ProductListLoaded;

    emit(
      ProductListLoading(
        products: currentState.products, 
        hasReachedMax: _hasReachedMax
      )
    );
    
    try {
      final newProducts = await getProducts(skip: _skip, limit: _limit);
      _skip += _limit;
      _hasReachedMax = newProducts.length < _limit;
      
      final updatedProducts = [...currentState.products, ...newProducts];
      emit(
        ProductListLoaded(
          updatedProducts, 
          hasReachedMax: _hasReachedMax
        ),
      );
    } catch (e) {
      emit(
        ProductListError(
          e.toString(),
        ),
      );
    }
  }
}
