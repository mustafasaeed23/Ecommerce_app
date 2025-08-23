import 'package:ecommerce/featuers/cart/data/models/cart_model.dart';
import 'package:ecommerce/featuers/cart/data/models/cart_product_model.dart';

class CartResponse {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final CartModel data;

  CartResponse({
    this.status,
    this.numOfCartItems,
    this.cartId,
    required this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'],
      numOfCartItems: json['numOfCartItems'],
      cartId: json['cartId'],
      data: CartModel.fromJson(json['data']),
    );
  }
}
