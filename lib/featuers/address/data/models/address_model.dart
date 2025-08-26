import 'package:ecommerce/featuers/address/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.sId,
    required super.name,
    required super.details,
    required super.phone,
    required super.city,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      sId: json['_id'],
      name: json['name'],
      details: json['details'],
      phone: json['phone'],
      city: json['city'],
    );
  }
}
