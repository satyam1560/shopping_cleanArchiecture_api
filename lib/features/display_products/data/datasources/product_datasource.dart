import 'package:dio/dio.dart';
import 'package:shopping_api/features/display_products/data/models/product_dto.dart';

class ProductDataSource {
  final Dio dio;

  ProductDataSource({required this.dio});

  Future<List<ProductDto>> getProduct() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      final products =
          responseData.map((item) => ProductDto.fromJson(item)).toList();
      return products;
    } else {
      throw DioException(
        message: 'Error in getting products',
        requestOptions: RequestOptions(),
      );
    }
  }
}
