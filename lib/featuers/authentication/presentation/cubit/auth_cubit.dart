import 'package:bloc/bloc.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/local/auth_shared_pref_local_data_source.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/featuers/authentication/data/models/login_request.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_request.dart';
import 'package:ecommerce/featuers/authentication/data/repositories/auth_repository.dart';
import 'package:ecommerce/featuers/authentication/domain/usecases/login_use_case.dart';
import 'package:ecommerce/featuers/authentication/domain/usecases/register_use_case.dart';
import 'package:ecommerce/featuers/authentication/presentation/cubit/auth_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUseCase, this.registerUseCase) : super(AuthInitial());

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  Future<void> register(RegisterRequest registerRequest) async {
    emit(RegisterLoading());
    final result = await registerUseCase.call(registerRequest);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (user) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());

    final result = await loginUseCase.login(loginRequest);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginSuccess()),
    );
  }
}
