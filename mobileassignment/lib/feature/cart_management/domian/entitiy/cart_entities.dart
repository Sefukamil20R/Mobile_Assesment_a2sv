// lib/domain/entities/cart_item.dart
import 'package:equatable/equatable.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';


class CartItem extends Equatable {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [product, quantity];
}
