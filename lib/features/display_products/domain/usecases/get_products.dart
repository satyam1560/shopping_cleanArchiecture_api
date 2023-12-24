import 'package:dartz/dartz.dart';
import 'package:shopping_api/features/display_products/data/failure.dart';
import 'package:shopping_api/features/display_products/domain/entities/product.dart';
import 'package:shopping_api/features/display_products/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts({
    required this.repository,
  });

  Future<Either<Failure, List<Product>>> getProducts() {
    return repository.getProducts();
  }
}
