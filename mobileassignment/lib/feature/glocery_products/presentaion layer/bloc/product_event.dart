// lib/feature/glocery_products/presentation/bloc/grocery_event.dart
import 'package:equatable/equatable.dart';

abstract class GroceryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAllGroceriesEvent extends GroceryEvent {}

class LoadGroceryByIdEvent extends GroceryEvent {
  final String id;

  LoadGroceryByIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}
