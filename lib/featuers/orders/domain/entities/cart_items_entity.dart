import 'package:ecommerce/featuers/orders/domain/entities/order_product_entity.dart';

class CartItemsEntity {
  final int count;
  final String sId;
  final OrderProductEntity product;
  final int price;

  CartItemsEntity({
    required this.count,
    required this.sId,
    required this.product,
    required this.price,
  });
}
