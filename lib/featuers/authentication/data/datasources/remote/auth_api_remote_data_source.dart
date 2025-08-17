import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/featuers/authentication/data/models/login_response.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_request.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_response.dart';
import 'package:injectable/injectable.dart';

import '../../models/login_request.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource extends AuthRemoteDataSource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.registerEndPoint,
        data: registerRequest.toJson(),
      );
      print("Remote response: ${response.data}");

      return RegisterResponse.fromJson(response.data);
    } catch (execption) {
      var message = "Failed To Register!";

      if (execption is DioException) {
        final response = RegisterResponse.fromJson(execption.response!.data);
        if (response.message != null) message = response.message!;
      }
      throw RemoteException(message);
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: loginRequest.toJson(),
      );
            print("Remote response: ${response.data}");

      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      var message = "Failed To Login!";

      if (exception is DioException) {
        final response = LoginResponse.fromJson(exception.response!.data);
        if (response.message != null) message = response.message!;
      }
      throw RemoteException(message);
    }
  }
}
