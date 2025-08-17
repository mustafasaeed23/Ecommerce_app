import 'package:ecommerce/featuers/authentication/data/models/login_response.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_request.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_response.dart';

import '../../models/login_request.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<LoginResponse> login(LoginRequest loginRequest);
}
