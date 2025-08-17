import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_request.dart';
import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';
import 'package:ecommerce/featuers/authentication/domain/repositories/auth_contract_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterUseCase {
  final AuthContractRepo contractRepo;

  RegisterUseCase(this.contractRepo);

  Future<Either<Failure, UserEntity>> call(
    RegisterRequest registerRequest,
  ) async {
    return await contractRepo.register(registerRequest);
  }
}
