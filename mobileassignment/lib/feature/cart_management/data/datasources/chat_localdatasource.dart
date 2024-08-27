// // lib/data/datasources/cart_local_data_source.dart
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mobileassignment/core/errors/failure.dart';
// import 'package:mobileassignment/feature/glocery_products/data/models/cart_item_model.dart';

// abstract class CartLocalDataSource {
//   Future<Either<Failure, List<CartItemModel>>> getCartItems();
//   Future<Either<Failure, void>> addToCart(CartItemModel cartItem);
//   Future<Either<Failure, void>> updateCartItem(CartItemModel cartItem);
//   Future<Either<Failure, void>> removeFromCart(CartItemModel cartItem);
//   Future<Either<Failure, void>> clearCart();
// }

// class CartLocalDataSourceImpl implements CartLocalDataSource {
//   final SharedPreferences sharedPreferences;

//   CartLocalDataSourceImpl(this.sharedPreferences);

//   @override
//   Future<Either<Failure, List<CartItemModel>>> getCartItems() async {
//     try {
//       final jsonString = sharedPreferences.getString('cart') ?? '[]';
//       final List<dynamic> data = json.decode(jsonString);
//       final cartItems = data.map((json) => CartItemModel.fromJson(json)).toList();
//       return Right(cartItems);
//     } catch (e) {
//       return Left(CacheFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> addToCart(CartItemModel cartItem) async {
//     try {
//       final jsonString = sharedPreferences.getString('cart') ?? '[]';
//       final List<dynamic> data = json.decode(jsonString);
//       data.add(cartItem.toJson());
//       await sharedPreferences.setString('cart', json.encode(data));
//       return Right(null);
//     } catch (e) {
//       return Left(CacheFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> updateCartItem(CartItemModel cartItem) async {
//     try {
//       final jsonString = sharedPreferences.getString('cart') ?? '[]';
//       final List<dynamic> data = json.decode(jsonString);
//       final index = data.indexWhere((item) => item['product']['id'] == cartItem.product.id);
//       if (index != -1) {
//         data[index] = cartItem.toJson();
//         await sharedPreferences.setString('cart', json.encode(data));
//         return Right(null);
//       } else {
//         return Left(CacheFailure());
//       }
//     } catch (e) {
//       return Left(CacheFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> removeFromCart(CartItemModel cartItem) async {
//     try {
//       final jsonString = sharedPreferences.getString('cart') ?? '[]';
//       final List<dynamic> data = json.decode(jsonString);
//       data.removeWhere((item) => item['product']['id'] == cartItem.product.id);
//       await sharedPreferences.setString('cart', json.encode(data));
//       return Right(null);
//     } catch (e) {
//       return Left(CacheFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> clearCart() async {
//     try {
//       await sharedPreferences.remove('cart');
//       return Right(null);
//     } catch (e) {
//       return Left(CacheFailure());
//     }
//   }
// }
