// lib/domain/usecases/get_all_groceries.dart
import 'package:dartz/dartz.dart';
import 'package:mobileassignment/core/errors/failure.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';
import 'package:mobileassignment/feature/glocery_products/domain/repository/glocery_repositories.dart';



class GetAllProductsusecase {
  final ProductRepository repository;

  GetAllProductsusecase(this.repository);

  Future<Either<Failure, List<Product>>> getAllProducts() async {
    return await repository.getAllProducts();
  }
}

