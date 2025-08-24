import 'package:ecommerce/featuers/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel extends ShippingAddressEntity {
  ShippingAddressModel({
    required super.details,
    required super.phone,
    required super.city,
  });
  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      details: json['details'],
      phone: json['phone'],
      city: json['city'],
    );
  }
}
