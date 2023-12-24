import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api/features/display_products/presentation/bloc/products_bloc.dart';
import 'package:shopping_api/features/display_products/presentation/pages/detail_page.dart';
import 'package:shopping_api/features/display_products/presentation/widgets/error_widget.dart';
import 'package:shopping_api/features/display_products/presentation/widgets/loading_widget.dart';
import 'package:shopping_api/features/display_products/presentation/widgets/product_card.dart';

class ProductDisplayScreen extends StatefulWidget {
  const ProductDisplayScreen({super.key});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).add(ProductsFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        leading: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white54),
            child: const Icon(Icons.list)),
        title: const Text(
          'ALL PRODUCT',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.loading) {
            return const ProductLoadingWidget();
          } else if (state.status == ProductStatus.error) {
            return const FailedToLoad();
          } else if (state.status == ProductStatus.success) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemCount: state.product!.length,
              itemBuilder: (context, index) {
                final product = state.product![index];
                return ProductCard(
                  imageUrl: product.image,
                  title: product.title,
                  price: product.price,
                  description: product.description,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          category: product.category,
                          imageUrl: product.image,
                          title: product.title,
                          price: product.price,
                          description: product.description,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
