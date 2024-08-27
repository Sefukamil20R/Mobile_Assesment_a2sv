import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';

class ProductModel extends Product {
  const ProductModel({
    required String id,
    required String title,
    required String imageUrl,
    required double rating,
    required double price,
    required double discount,
    required String description,
    required List<ProductOptionModel> options,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          rating: rating,
          price: price,
          discount: discount,
          description: description,
          options: options,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String? ?? '', // Handle null and default to empty string
      title: json['title'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0, // Handle null and default to 0.0
      price: (json['price'] as num?)?.toDouble() ?? 0.0, // Handle null and default to 0.0
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0, // Handle null and default to 0.0
      description: json['description'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((option) => ProductOptionModel.fromJson(option as Map<String, dynamic>))
              .toList() ??
          [], // Handle null and default to empty list
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options.map((option) => option.toJson()).toList(),
    };
  }
}

class ProductOptionModel extends ProductOption {
  const ProductOptionModel({
    required String id,
    required String name,
    required double price,
  }) : super(
          id: id,
          name: name,
          price: price,
        );

  factory ProductOptionModel.fromJson(Map<String, dynamic> json) {
    return ProductOptionModel(
      id: json['id'] as String? ?? '', // Handle null and default to empty string
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0, // Handle null and default to 0.0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
