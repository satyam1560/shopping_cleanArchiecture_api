import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_api/features/display_products/data/datasources/product_datasource.dart';
import 'package:shopping_api/features/display_products/data/repositories/product_repository_impl.dart';
import 'package:shopping_api/features/display_products/domain/repositories/product_repository.dart';
import 'package:shopping_api/features/display_products/domain/usecases/get_products.dart';
import 'package:shopping_api/features/display_products/presentation/bloc/products_bloc.dart';

final sl = GetIt.I; // sl == service locator

Future<void> productInstanceInit() async {
//! applicaton layer
// Factory = every time a new/fresh instance of that class
// singleton = every time it will take a same instance
  sl.registerFactory(() => ProductsBloc(getProducts: sl()));

//! domain  layer
  sl.registerFactory(() => GetProducts(repository: sl()));

//! data layer
  sl.registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(productDataSource: sl()));
  sl.registerFactory(() => ProductDataSource(dio: sl()));

//! externs
  sl.registerFactory(() => Dio());
}
