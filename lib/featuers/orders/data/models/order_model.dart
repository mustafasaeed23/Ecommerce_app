import 'package:ecommerce/featuers/orders/data/models/cart_items_model.dart';
import 'package:ecommerce/featuers/orders/data/models/order_user_model.dart';
import 'package:ecommerce/featuers/orders/data/models/shipping_address_model.dart';
import 'package:ecommerce/featuers/orders/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  final String? updatedAt;
  final int? iV;

  OrderModel({
    required super.shippingAddress,
    required super.taxPrice,
    required super.shippingPrice,
    required super.totalOrderPrice,
    required super.paymentMethodType,
    required super.isPaid,
    required super.isDelivered,
    required super.sId,
    required super.user,
    required super.cartItems,
    required super.id,
    required super.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
      taxPrice: json['taxPrice'],
      shippingPrice: json['shippingPrice'],
      totalOrderPrice: json['totalOrderPrice'],
      paymentMethodType: json['paymentMethodType'],
      isPaid: json['isPaid'],
      isDelivered: json['isDelivered'],
      sId: json['_id'],
      user: OrderUserModel.fromJson(json['user']),
      cartItems: List<CartItemsModel>.from(
        json['cartItems'].map((x) => CartItemsModel.fromJson(x)),
      ),
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }
}
