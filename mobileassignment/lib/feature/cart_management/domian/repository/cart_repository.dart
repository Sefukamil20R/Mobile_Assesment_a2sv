// // lib/domain/repositories/cart_repository.dart
// import 'package:dartz/dartz.dart';
// import 'package:mobileassignment/core/errors/failure.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/entities/cartitem_entiity.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';


// abstract class CartRepository {
//   Future<Either<Failure, List<CartItem>>> getCartItems();
//   Future<Either<Failure, void>> addToCart(Product product, int quantity);
//   Future<Either<Failure, void>> updateCartItem(Product product, int quantity);
//   Future<Either<Failure, void>> removeFromCart(Product product);
//   Future<Either<Failure, void>> clearCart();
// }
