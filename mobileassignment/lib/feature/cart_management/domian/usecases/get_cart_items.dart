// // lib/domain/usecases/get_cart_items.dart

// import 'package:mobileassignment/core/errors/failure.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/entities/cartitem_entiity.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/repository/cart_repository.dart';
// import 'package:dartz/dartz.dart';
// class GetCartItemsusecase {
//   final CartRepository repository;

//   GetCartItemsusecase(this.repository);

//   Future<Either<Failure, List<CartItem>>> getCartItems() async {
//     return await repository.getCartItems();
//   }
// }
