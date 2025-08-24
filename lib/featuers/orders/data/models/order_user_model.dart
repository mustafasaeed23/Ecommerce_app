import 'package:ecommerce/featuers/orders/domain/entities/order_user_entity.dart';

class OrderUserModel extends OrderUserEntity {
  OrderUserModel({
    required super.sId,
    required super.name,
    required super.email,
    required super.phone,
  });
  factory OrderUserModel.fromJson(Map<String, dynamic> json) {
    return OrderUserModel(
      sId: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
