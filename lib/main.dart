import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/display_products/data/datasources/product_datasource.dart';
import 'features/display_products/data/repositories/product_repository_impl.dart';
import 'features/display_products/domain/usecases/get_products.dart';
import 'features/display_products/presentation/bloc/products_bloc.dart';
import 'features/display_products/presentation/pages/product_display_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(
        GetProducts(
          repository: ProductRepositoryImpl(
            productDataSource: ProductDataSource(),
          ),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Api',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductDisplayScreen(),
      ),
    );
  }
}
