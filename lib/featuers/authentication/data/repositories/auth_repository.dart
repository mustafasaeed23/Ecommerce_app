import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/featuers/authentication/data/models/login_request.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_request.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';
import 'package:ecommerce/featuers/authentication/domain/repositories/auth_contract_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthContractRepo)
class AuthRepository implements AuthContractRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepository(this.authRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final response = await authRemoteDataSource.register(registerRequest);
      if (response.token != null && response.user != null) {
        print("token ${response.token}");
        print("user ${response.user}");
        await authLocalDataSource.saveToken(response.token!);
        await authLocalDataSource.saveUser(response.user!);
        return Right(response.user!);
        
      } else {
        return Left(Failure());
      }
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(LoginRequest loginRequest) async {
    try {
      final response = await authRemoteDataSource.login(loginRequest);
      if (response.token != null && response.user != null) {
        await authLocalDataSource.saveToken(response.token!);
        await authLocalDataSource.saveUser(response.user!);
        return Right(response.user!);
      } else {
        return Left(Failure());
      }
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
