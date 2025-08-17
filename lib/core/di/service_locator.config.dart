// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce/featuers/authentication/data/datasources/local/auth_local_data_source.dart'
    as _i196;
import 'package:ecommerce/featuers/authentication/data/datasources/local/auth_shared_pref_local_data_source.dart'
    as _i107;
import 'package:ecommerce/featuers/authentication/data/datasources/remote/auth_api_remote_data_source.dart'
    as _i23;
import 'package:ecommerce/featuers/authentication/data/datasources/remote/auth_remote_data_source.dart'
    as _i923;
import 'package:ecommerce/featuers/authentication/data/repositories/auth_repository.dart'
    as _i840;
import 'package:ecommerce/featuers/authentication/domain/repositories/auth_contract_repo.dart'
    as _i677;
import 'package:ecommerce/featuers/authentication/domain/usecases/login_use_case.dart'
    as _i939;
import 'package:ecommerce/featuers/authentication/domain/usecases/register_use_case.dart'
    as _i790;
import 'package:ecommerce/featuers/authentication/presentation/cubit/auth_cubit.dart'
    as _i766;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i196.AuthLocalDataSource>(
      () => _i107.AuthSharedPrefLocalDataSource(),
    );
    gh.singleton<_i923.AuthRemoteDataSource>(
      () => _i23.AuthApiRemoteDataSource(),
    );
    gh.singleton<_i677.AuthContractRepo>(
      () => _i840.AuthRepository(
        gh<_i923.AuthRemoteDataSource>(),
        gh<_i196.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i939.LoginUseCase>(
      () => _i939.LoginUseCase(gh<_i677.AuthContractRepo>()),
    );
    gh.singleton<_i790.RegisterUseCase>(
      () => _i790.RegisterUseCase(gh<_i677.AuthContractRepo>()),
    );
    gh.singleton<_i766.AuthCubit>(
      () => _i766.AuthCubit(
        gh<_i939.LoginUseCase>(),
        gh<_i790.RegisterUseCase>(),
      ),
    );
    return this;
  }
}
