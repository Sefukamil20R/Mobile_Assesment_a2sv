import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobileassignment/core/network/network_info.dart';
import 'package:mobileassignment/feature/glocery_products/data/datasources/localdatasource.dart';
import 'package:mobileassignment/feature/glocery_products/data/datasources/remotedatasource.dart';
import 'package:mobileassignment/feature/glocery_products/data/repositoryimpl/repositoryimplementaion.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/repository/cart_repository.dart';
import 'package:mobileassignment/feature/glocery_products/domain/repository/glocery_repositories.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/usecases/add_cart_tems.dart';
import 'package:mobileassignment/feature/glocery_products/domain/usecases/get_all_gloceries.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/usecases/get_cart_items.dart';
import 'package:mobileassignment/feature/glocery_products/domain/usecases/get_glocery_byid.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/usecases/update_card_items.dart';
// import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/cart_bloc.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/product_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:data_connection_checker_tv/data_connection_checker.dart';

final locator = GetIt.instance;
Future <void> setupLocator() async {

//glocery_bloc
locator.registerFactory(() => GroceryBloc (getAllProductsusecase: locator(), getProductById: locator(),));
//cart_bloc
// locator.registerFactory(() => CartBloc (getCartItems: locator(), addToCartusecase: locator(), updateCartItem: locator(),));
//usecases

locator.registerLazySingleton(() => GetAllProductsusecase(locator()));
locator.registerLazySingleton(() => GetProductByIdusecase(locator()));
// locator.registerLazySingleton(() => AddToCartusecase(locator()));
// locator.registerLazySingleton(() => UpdateCartItemusecase(locator()));
// locator.registerLazySingleton(() => GetCartItemsusecase(locator()));
// //repositories
locator.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(remoteDataSource: locator(), localDataSource: locator(), networkInfo: locator()));
// locator.registerLazySingleton<CartRepository>(() => ProductRepositoryImpl(remoteDataSource: locator(), localDataSource: locator(), networkInfo: locator()));
//datasource
 locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client:locator()
  ));
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(
    sharedPreferences: locator(),
  ));
  // network_info
  //core
   locator.registerLazySingleton<Network_info>(
      () => NetworkInfoImpl(locator()));
  // External
  final sharedPreference = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreference);
  locator.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  locator.registerLazySingleton<http.Client>(() => http.Client());
 




}