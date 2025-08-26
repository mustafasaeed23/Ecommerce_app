import 'package:ecommerce/featuers/orders/domain/entities/cart_items_entity.dart';
import 'package:ecommerce/featuers/orders/domain/entities/order_user_entity.dart';
import 'package:ecommerce/featuers/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final ShippingAddressEntity shippingAddress;
  final double taxPrice;
  final double shippingPrice;
  final double totalOrderPrice;
  final String paymentMethodType;
  final bool isPaid;
  final bool isDelivered;
  final String sId;
  final OrderUserEntity user;
  final List<CartItemsEntity> cartItems;
  final int id;
  final String createdAt;

  OrderEntity({
    required this.shippingAddress,
    required this.taxPrice,
    required this.shippingPrice,
    required this.totalOrderPrice,
    required this.paymentMethodType,
    required this.isPaid,
    required this.isDelivered,
    required this.sId,
    required this.user,
    required this.cartItems,
    required this.id,
    required this.createdAt,
  });
}
