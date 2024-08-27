// // lib/feature/glocery_products/presentation/bloc/cart_state.dart
// import 'package:equatable/equatable.dart';
// import 'package:mobileassignment/core/errors/failure.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/entities/cartitem_entiity.dart';

// abstract class CartState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class CartInitialState extends CartState {}

// class CartLoadingState extends CartState {}

// class CartItemsLoadedState extends CartState {
//   final List<CartItem> cartItems;

//   CartItemsLoadedState(this.cartItems);

//   @override
//   List<Object?> get props => [cartItems];
// }

// class CartActionSuccessState extends CartState {}

// class CartErrorState extends CartState {
//   final Failure failure;

//   CartErrorState(this.failure);

//   @override
//   List<Object?> get props => [failure];
// }
