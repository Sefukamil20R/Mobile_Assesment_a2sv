// lib/feature/glocery_products/presentation/bloc/cart_event.dart
import 'package:equatable/equatable.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCartItemsEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final Product product;
  final int quantity;

  AddToCartEvent(this.product, this.quantity);

  @override
  List<Object?> get props => [product, quantity];
}

class UpdateCartItemEvent extends CartEvent {
  final Product product;
  final int quantity;

  UpdateCartItemEvent(this.product, this.quantity);

  @override
  List<Object?> get props => [product, quantity];
}
