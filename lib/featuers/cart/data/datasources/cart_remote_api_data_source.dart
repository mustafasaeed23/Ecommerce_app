import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/cart/data/datasources/cart_remote_data_source.dart';
import 'package:ecommerce/featuers/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteApiDataSource implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteApiDataSource(this.dio);
  @override
  Future<void> addToCart(String productId) async {
    try {
      await dio.post(ApiConstants.cartEndPoint, data: {"productId": productId});
    } catch (_) {
      throw RemoteException("Failed To Add To Cart");
    }
  }

  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await dio.get(ApiConstants.cartEndPoint);
      print("Remote response: ${response.data}");
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      print('Cart parse error: $exception');
      throw RemoteException("Failed To get Cart");
    }
  }

  @override
  Future<CartResponse> updateCart(String productId, int quantity) async {
    try {
      final response = await dio.put(
        '${ApiConstants.cartEndPoint}/$productId',
        data: {"count": quantity},
      );
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      throw RemoteException("Failed To update product quantity");
    }
  }

  @override
  Future<CartResponse> deleteFromCart(String productId) async {
    try {
      final response = await dio.delete(
        '${ApiConstants.cartEndPoint}/$productId',
      );
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      throw RemoteException("Failed To delete product from cart");
    }
  }
}
