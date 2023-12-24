part of 'products_bloc.dart';

enum ProductStatus { initial, loading, error, success }

class ProductState extends Equatable {
  final ProductStatus status;
  final List<Product>? product;
  final Failure? failure;

  const ProductState({
    required this.status,
    this.product,
    this.failure,
  });

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? product,
    Failure? failure,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
      failure: failure ?? this.failure,
    );
  }

  factory ProductState.initial() => const ProductState(
        status: ProductStatus.initial,
      );

  @override
  List<Object?> get props => [
        status,
        product,
        failure,
      ];
}
