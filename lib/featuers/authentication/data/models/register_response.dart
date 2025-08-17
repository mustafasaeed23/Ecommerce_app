import 'package:ecommerce/featuers/authentication/data/models/user_model.dart';

class RegisterResponse {
  final String? message;
  final UserModel? user;
  final String? token;

  RegisterResponse({this.message, this.user, this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    return RegisterResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: userJson is Map<String, dynamic>
          ? UserModel.fromJson(userJson)
          : null, // ✅ safe guard
    );
  }
}
