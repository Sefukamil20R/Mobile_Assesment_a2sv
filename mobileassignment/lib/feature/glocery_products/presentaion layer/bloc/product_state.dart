// lib/feature/glocery_products/presentation/bloc/grocery_state.dart
import 'package:equatable/equatable.dart';
import 'package:mobileassignment/core/errors/failure.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';

abstract class GroceryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GroceryInitialState extends GroceryState {}

class GroceryLoadingState extends GroceryState {}

class GroceryLoadedState extends GroceryState {
  final List<Product> products;

  GroceryLoadedState(this.products);

  @override
  List<Object?> get props => [products];
}

class GroceryByIdLoadedState extends GroceryState {
  final Product product;

  GroceryByIdLoadedState(this.product);

  @override
  List<Object?> get props => [product];
}

class GroceryErrorState extends GroceryState {
  final Failure failure;

  GroceryErrorState(this.failure);

  @override
  List<Object?> get props => [failure];
}
class Gloceryfailed extends GroceryState {
  final String errorMessage;

  Gloceryfailed(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
