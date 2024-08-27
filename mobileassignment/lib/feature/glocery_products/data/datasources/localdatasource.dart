// lib/data/datasources/local_data_source.dart
import 'dart:convert';
import 'package:mobileassignment/core/errors/exceptions.dart';
import 'package:mobileassignment/feature/glocery_products/data/models/productmodels.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class LocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}

const CACHED_PRODUCTS = 'CACHED_PRODUCTS';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ProductModel>> getCachedProducts() {
    final jsonString = sharedPreferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return Future.value(
          jsonList.map((json) => ProductModel.fromJson(json)).toList());
    } else {
      throw CacheException(message: 'No cached data');
    }
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) {
    final jsonString = json.encode(products
        .map((product) => (product as ProductModel).toJson())
        .toList());
    sharedPreferences.setString(CACHED_PRODUCTS, jsonString);
    return Future.value();
  }
}
