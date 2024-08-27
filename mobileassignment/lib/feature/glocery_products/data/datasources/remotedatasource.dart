import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileassignment/core/constants/constants.dart';
import 'package:mobileassignment/core/errors/exceptions.dart';
import 'package:mobileassignment/feature/glocery_products/data/models/productmodels.dart';

abstract class RemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(String id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(
      Uri.parse(ApiConstants.groceriesEndpoint),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> jsonList = data['data'] as List<dynamic>? ?? []; // Handle null and default to empty list
      return jsonList.map((json) => ProductModel.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw ServerException(message: 'Server error');
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await client.get(
      Uri.parse('${ApiConstants.groceriesEndpoint}/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return ProductModel.fromJson(data['data'] as Map<String, dynamic>); // Ensure data is properly cast
    } else {
      throw ServerException(message: 'Server error');
    }
  }
}
