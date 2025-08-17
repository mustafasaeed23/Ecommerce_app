import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/authentication/data/models/login_request.dart';
import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';
import 'package:ecommerce/featuers/authentication/domain/repositories/auth_contract_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginUseCase {
  final AuthContractRepo authContractRepo;

  LoginUseCase(this.authContractRepo);

  Future<Either<Failure, UserEntity>> login(LoginRequest loginRequest) async =>
      await authContractRepo.login(loginRequest);
}
