// // lib/feature/glocery_products/presentation/bloc/cart_bloc.dart
// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/usecases/add_cart_tems.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/usecases/get_cart_items.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/usecases/update_card_items.dart';
// import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/cart_bloc/cart_event.dart';
// import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/cart_bloc/cart_state.dart';

// class CartBloc extends Bloc<CartEvent, CartState> {
//   final GetCartItemsusecase getCartItems;
//   final AddToCartusecase addToCartusecase;
//   final UpdateCartItemusecase updateCartItem;

//   CartBloc({
//     required this.getCartItems,
//     required this.addToCartusecase,
//     required this.updateCartItem,
//   }) : super(CartInitialState()) {
//     on<LoadCartItemsEvent>(_onLoadCartItemsEvent);
//     on<AddToCartEvent>(_onAddToCartEvent);
//     on<UpdateCartItemEvent>(_onUpdateCartItemEvent);
//   }

//   Future<void> _onLoadCartItemsEvent(LoadCartItemsEvent event, Emitter<CartState> emit) async {
//     emit(CartLoadingState());
//     final result = await getCartItems.getCartItems();
//     result.fold(
//       (failure) => emit(CartErrorState(failure)),
//       (cartItems) => emit(CartItemsLoadedState(cartItems)),
//     );
//   }

//   Future<void> _onAddToCartEvent(AddToCartEvent event, Emitter<CartState> emit) async {
//     emit(CartLoadingState());
//     final result = await addToCartusecase.addToCart(event.product, event.quantity);
//     result.fold(
//       (failure) => emit(CartErrorState(failure)),
//       (_) => emit(CartActionSuccessState()),
//     );
//   }

//   Future<void> _onUpdateCartItemEvent(UpdateCartItemEvent event, Emitter<CartState> emit) async {
//     emit(CartLoadingState());
//     final result = await updateCartItem.updateCartItem(event.product, event.quantity);
//     result.fold(
//       (failure) => emit(CartErrorState(failure)),
//       (_) => emit(CartActionSuccessState()),
//     );
//   }
// }
