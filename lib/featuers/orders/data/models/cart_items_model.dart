import 'package:ecommerce/featuers/orders/data/models/order_product_model.dart';
import 'package:ecommerce/featuers/orders/domain/entities/cart_items_entity.dart';

class CartItemsModel extends CartItemsEntity {
  final String? productId;

  CartItemsModel({
    required super.count,
    required super.sId,
    required super.product,
    required super.price,
    this.productId,
  });

  factory CartItemsModel.fromJson(Map<String, dynamic> json) {
    return CartItemsModel(
      count: json['count'] ?? 0,
      sId: json['_id'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      product: (json['product'] is Map)
          ? OrderProductModel.fromJson(json['product'])
          : OrderProductModel(
              id: json['product'] ?? '',
              title: '',
              imageCover: '',
              ratingsAverage: 0.0,
            ),
      productId: json['product'] is String ? json['product'] : null,
    );
  }
}