import 'package:ecommerce/featuers/cart/data/models/cart_item_model.dart';
import 'package:ecommerce/featuers/cart/data/models/cart_response.dart';
import 'package:ecommerce/featuers/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  final String? sId;
  final String? cartOwner;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  CartModel({
    this.sId,
    this.cartOwner,
    required super.totalCartPrice,
    this.createdAt,
    this.updatedAt,
    this.iV,
    required super.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      sId: json['_id'],
      cartOwner: json['cartOwner'],
      products: (json['products'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
      totalCartPrice: json['totalCartPrice'],
    );
  }
}
