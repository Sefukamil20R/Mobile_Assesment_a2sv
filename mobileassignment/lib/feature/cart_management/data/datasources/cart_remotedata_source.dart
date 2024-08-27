// // lib/data/datasources/cart_remote_data_source.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:dartz/dartz.dart';
// import 'package:mobileassignment/core/errors/failure.dart';

// abstract class CartRemoteDataSource {
//   Future<Either<Failure, List<CartItemModel>>> getCartItems();
//   Future<Either<Failure, void>> addToCart(ProductModel product, int quantity);
//   Future<Either<Failure, void>> updateCartItem(ProductModel product, int quantity);
//   Future<Either<Failure, void>> removeFromCart(ProductModel product);
//   Future<Either<Failure, void>> clearCart();
// }

// class CartRemoteDataSourceImpl implements CartRemoteDataSource {
//   final http.Client client;

//   CartRemoteDataSourceImpl(this.client);

//   @override
//   Future<Either<Failure, List<CartItemModel>>> getCartItems() async {
//     try {
//       final response = await client.get(Uri.parse('your_api_endpoint/cart'));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body)['data'];
//         final cartItems = data.map((json) => CartItemModel.fromJson(json)).toList();
//         return Right(cartItems);
//       } else {
//         return Left(ServerFailure());
//       }
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> addToCart(ProductModel product, int quantity) async {
//     try {
//       final response = await client.post(
//         Uri.parse('your_api_endpoint/cart/add'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'product': product.toJson(),
//           'quantity': quantity,
//         }),
//       );
//       return response.statusCode == 200 ? Right(null) : Left(ServerFailure());
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> updateCartItem(ProductModel product, int quantity) async {
//     try {
//       final response = await client.put(
//         Uri.parse('your_api_endpoint/cart/update'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'product': product.toJson(),
//           'quantity': quantity,
//         }),
//       );
//       return response.statusCode == 200 ? Right(null) : Left(ServerFailure());
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> removeFromCart(ProductModel product) async {
//     try {
//       final response = await client.delete(
//         Uri.parse('your_api_endpoint/cart/remove'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({'product': product.toJson()}),
//       );
//       return response.statusCode == 200 ? Right(null) : Left(ServerFailure());
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, void>> clearCart() async {
//     try {
//       final response = await client.delete(Uri.parse('your_api_endpoint/cart/clear'));
//       return response.statusCode == 200 ? Right(null) : Left(ServerFailure());
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }
// }
