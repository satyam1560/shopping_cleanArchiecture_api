import 'package:dartz/dartz.dart';
import 'package:shopping_api/features/display_products/data/failure.dart';
import 'package:shopping_api/features/display_products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
