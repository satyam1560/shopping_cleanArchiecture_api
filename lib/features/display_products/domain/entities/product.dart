import 'package:equatable/equatable.dart';
import 'package:shopping_api/features/display_products/data/models/product_dto.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
  });

  static Product fromModel(ProductDto model) {
    return Product(
      id: model.id,
      title: model.title,
      description: model.description,
      category: model.category,
      image: model.image,
      price: model.price,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        image,
        price,
      ];
}
