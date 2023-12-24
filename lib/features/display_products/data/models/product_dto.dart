import 'package:shopping_api/features/display_products/domain/entities/product.dart';

class ProductDto extends Product {
  const ProductDto({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.image,
    required super.price,
  });

  factory ProductDto.fromJson(Map<String, dynamic> map) {
    return ProductDto(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
    );
  }
}
