import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_request.dart';
import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';

import '../../data/models/login_request.dart';

abstract class AuthContractRepo {
  Future<Either<Failure, UserEntity>> register(RegisterRequest registerRequest);
  Future<Either<Failure, UserEntity>> login(LoginRequest loginRequest);
}
