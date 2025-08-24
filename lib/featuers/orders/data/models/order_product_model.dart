import 'package:ecommerce/featuers/orders/domain/entities/order_product_entity.dart';

class OrderProductModel extends OrderProductEntity {
  final int? ratingsQuantity;

  OrderProductModel({
    this.ratingsQuantity,
    required super.title,
    required super.imageCover,
    required super.ratingsAverage,
    required super.id,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      ratingsQuantity: json['ratingsQuantity'],
      title: json['title'],
      imageCover: json['imageCover'],
      ratingsAverage: (json['ratingsAverage'] != null)
          ? double.parse(json['ratingsAverage'].toString())
          : 0.0,
      id: json['_id'],
    );
  }
}
