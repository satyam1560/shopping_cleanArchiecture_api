import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_api/features/display_products/data/datasources/product_datasource.dart';
import 'package:shopping_api/features/display_products/data/failure.dart';
import 'package:shopping_api/features/display_products/domain/entities/product.dart';
import 'package:shopping_api/features/display_products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;
  ProductRepositoryImpl({
    required this.productDataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final result = await productDataSource.getProduct();
      final products = result.map(Product.fromModel).toList();

      return Right(products);
    } on DioException catch (error) {
      return Left(
        Failure(
          statusCode: error.response?.statusCode,
          message: error.message,
        ),
      );
    }
  }
}
