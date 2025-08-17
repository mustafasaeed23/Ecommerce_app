import 'package:ecommerce/featuers/authentication/data/models/user_model.dart';

class LoginResponse {
  final String? message;
  final UserModel? user;
  final String? token;

  LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }

 
}
