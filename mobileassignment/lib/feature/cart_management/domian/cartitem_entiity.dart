// lib/data/repositories/cart_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:mobileassignment/core/errors/failure.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/cartitem_entiity.dart';
import 'package:mobileassignment/feature/glocery_products/domain/repositories/cart_repository.dart';
import 'package:mobileassignment/feature/glocery_products/data/datasources/cart_local_data_source.dart';
import 'package:mobileassignment/feature/glocery_products/data/datasources/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<CartItem>>> getCartItems() async {
    try {
      final remoteResult = await remoteDataSource.getCartItems();
      return remoteResult.fold(
        (failure) async {
          final localResult = await localDataSource.getCartItems();
          return localResult.fold(
            (failure) => Left(failure),
            (cartItems) => Right(cartItems),
          );
        },
        (cartItems) async {
          await localDataSource.clearCart(); // Clear local cache before updating
          await Future.wait(cartItems.map((item) => localDataSource.addToCart(item)));
          return Right(cartItems);
        },
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(Product product, int quantity) async {
    final cartItem = CartItemModel(product: ProductModel.fromEntity(product), quantity: quantity);
    return await localDataSource.addToCart(cartItem);
  }

  @override
  Future<Either<Failure, void>> updateCartItem(Product product, int quantity) async {
    final cartItem = CartItemModel(product: ProductModel.fromEntity(product), quantity: quantity);
    return await localDataSource.updateCartItem(cartItem);
  }

  @override
  Future<Either<Failure, void>> removeFromCart(Product product) async {
    final cartItem = CartItemModel(product: ProductModel.fromEntity(product), quantity: 0);
    return await localDataSource.removeFromCart(cartItem);
  }

  @override
  Future<Either<Failure, void>> clearCart() async {
    return await localDataSource.clearCart();
  }
}
