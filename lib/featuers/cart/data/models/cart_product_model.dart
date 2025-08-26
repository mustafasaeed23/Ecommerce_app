import 'package:ecommerce/featuers/cart/domain/entities/cart_product_entity.dart';

class CartProductModel extends CartProductEntity {
  CartProductModel({
    required super.sId,
    required super.title,
    required super.imageCover,
    required super.ratingsAverage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      sId: json['_id'] ?? '',
      title: json['title'] ?? '',
      imageCover: json['imageCover'] ?? '',
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
