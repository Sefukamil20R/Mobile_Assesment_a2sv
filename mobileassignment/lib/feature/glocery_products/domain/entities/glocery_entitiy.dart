// lib/domain/entities/grocery.dart
import 'package:equatable/equatable.dart';
// lib/domain/entities/product.dart

class Product extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<ProductOption> options;

  const Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });

  @override
  List<Object?> get props => [id, title, imageUrl, rating, price, discount, description, options];
}

class ProductOption extends Equatable {
  final String id;
  final String name;
  final double price;

  const ProductOption({
    required this.id,
    required this.name,
    required this.price,
  });
    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
  @override
  List<Object?> get props => [id, name, price];
}
