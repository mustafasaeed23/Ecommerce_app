import 'package:ecommerce/featuers/cart/data/models/cart_product_model.dart';
import 'package:ecommerce/featuers/cart/domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.count,
    required super.sId,
    required super.product,
    required super.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    count: json['count'],
    sId: json['_id'],
    product: CartProductModel.fromJson(json['product']),
    price: json['price'],
  );
}
