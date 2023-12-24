import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api/features/display_products/data/failure.dart';
import 'package:shopping_api/features/display_products/domain/entities/product.dart';
import 'package:shopping_api/features/display_products/domain/usecases/get_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductState> {
  GetProducts getProducts;
  ProductsBloc(this.getProducts) : super(ProductState.initial()) {
    on<ProductsFetched>(_onProductsFetched);
  }
  Future<void> _onProductsFetched(
    ProductsFetched event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));
    final result = await getProducts.getProducts();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductStatus.error,
          failure: Failure(message: failure.message),
        ),
      ),
      (productData) => emit(
        state.copyWith(
          status: ProductStatus.success,
          product: productData,
        ),
      ),
    );
  }
}
