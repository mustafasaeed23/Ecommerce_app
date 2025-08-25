import 'package:ecommerce/featuers/cart/domain/entities/cart_product_entity.dart';

class CartItemEntity {
   final int count;
  final String sId;
  final CartProductEntity product;
  final double price;

  CartItemEntity({
    required this.count,
    required this.sId,
    required this.product,
    required this.price,
  });
}