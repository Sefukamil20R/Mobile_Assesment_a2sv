// lib/domain/usecases/get_grocery_by_id.dart



import 'package:mobileassignment/core/errors/failure.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';
import 'package:mobileassignment/feature/glocery_products/domain/repository/glocery_repositories.dart';
import 'package:dartz/dartz.dart';
class GetProductByIdusecase{
  final ProductRepository repository;

  GetProductByIdusecase(this.repository);

  Future<Either<Failure, Product>> getProductById( String id) async {
    return await repository.getProductById(id);
  }
}

