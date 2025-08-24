import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  static UserModel fromEntity(UserEntity u) =>
      UserModel(name: u.name, email: u.email);
}
