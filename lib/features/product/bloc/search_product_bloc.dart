import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/product/domain/entities/product.dart';
import 'package:flutter_assignment/features/product/domain/usecases/search_products.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc
    extends Bloc<SearchProductEvent, SearchProductState> {

  final SearchProducts searchProducts;

  SearchProductBloc(this.searchProducts)
      : super(SearchProductInitial()) {
        
    on<SearchProductQueryChanged>(_onSearch);
  }

  Future<void> _onSearch(
    SearchProductQueryChanged event,
    Emitter<SearchProductState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(SearchProductInitial());
      return;
    }

    emit(SearchProductLoading());

    try {
      final result = await searchProducts(query);

      if (result.isEmpty) {
        emit(SearchProductEmpty());
      } else {
        emit(SearchProductLoaded(result));
      }
    } catch (e) {
      emit(SearchProductError(e.toString()));
    }
  }
}