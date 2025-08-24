import 'package:ecommerce/featuers/orders/data/models/order_product_model.dart';
import 'package:ecommerce/featuers/orders/domain/entities/cart_items_entity.dart';

class CartItemsModel extends CartItemsEntity {
  CartItemsModel({
    required super.count,
    required super.sId,
    required super.product,
    required super.price,
  });

  factory CartItemsModel.fromJson(Map<String, dynamic> json) {
    return CartItemsModel(
      count: json['count'],
      sId: json['_id'],
      product: OrderProductModel.fromJson(json['product']),
      price: json['price'],
    );
  }
}
