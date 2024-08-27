// // lib/domain/usecases/update_cart_item.dart


// import 'package:mobileassignment/core/errors/failure.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/repository/cart_repository.dart';
// import 'package:dartz/dartz.dart';
// class UpdateCartItemusecase {
//   final CartRepository repository;

//   UpdateCartItemusecase(this.repository);

//   Future<Either<Failure, void>> updateCartItem(Product product,int quantity) async {
//     return await repository.updateCartItem(product, quantity);
//   }
// }
