import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/products/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductsRemoteApiDataSource {
  final Dio dio;

  ProductsRemoteApiDataSource(this.dio);

  Future<ProductsResponse> getProducts() async {
    try {
      final response = await dio.get(ApiConstants.productsEndPoint);
      return ProductsResponse.fromJson(response.data);
    } catch (e) {
      throw RemoteException("Failed To get Products");
    }
  }
}
