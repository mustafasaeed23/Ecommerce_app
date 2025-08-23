import 'package:ecommerce/featuers/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> products;
  final int totalCartPrice;

  CartEntity({required this.products, required this.totalCartPrice});
}
