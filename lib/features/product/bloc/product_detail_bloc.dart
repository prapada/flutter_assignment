import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/product/domain/entities/product_detail.dart';
import 'package:flutter_assignment/features/product/domain/usecases/get_product_detail.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetail getProductDetail;

  ProductDetailBloc(this.getProductDetail) : super(ProductDetailInitial()) {
    on<LoadProductDetail>(_onLoadProductDetail);
  }

  Future<void> _onLoadProductDetail(
    LoadProductDetail event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(ProductDetailLoading());
    try {
      final product = await getProductDetail(event.id);
      emit(
        ProductDetailLoaded(
          product: product,
        ),
      );
    } catch (e) {
      emit(
        ProductDetailError(e.toString())
      );
    }
  }
}
