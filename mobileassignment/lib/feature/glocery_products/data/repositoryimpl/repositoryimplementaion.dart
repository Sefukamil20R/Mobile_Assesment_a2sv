// lib/data/repositories/product_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:mobileassignment/core/errors/exceptions.dart';
import 'package:mobileassignment/core/errors/failure.dart';
import 'package:mobileassignment/core/network/network_info.dart';
import 'package:mobileassignment/feature/glocery_products/data/datasources/localdatasource.dart';
import 'package:mobileassignment/feature/glocery_products/data/datasources/remotedatasource.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';
import 'package:mobileassignment/feature/glocery_products/domain/repository/glocery_repositories.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final Network_info networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProducts();
        localDataSource.cacheProducts(remoteProducts);
        return Right(remoteProducts.cast<Product>());
      } on ServerException {
        return Left( Failure('Server Failure'));
      }
    } else {
      try {
        final localProducts = await localDataSource.getCachedProducts();
        return Right(localProducts.cast<Product>());
      } on CacheException {
        return Left(Failure('cachefailure'));
      }
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getProductById(id);
        return Right(remoteProduct as Product);
      } on ServerException {
        return Left(Failure('server failure'));
      }
    } else {
      return Left(Failure('failure'));
    }
  }
}
