// lib/domain/repositories/grocery_repository.dart


import 'package:mobileassignment/core/errors/failure.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getProductById(String id);
}

