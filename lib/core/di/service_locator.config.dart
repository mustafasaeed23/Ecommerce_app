// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/di/register_module.dart' as _i709;
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
import 'package:ecommerce/featuers/home/data/datasources/home_remote_api_data_source.dart'
    as _i143;
import 'package:ecommerce/featuers/home/data/datasources/home_remote_data_source.dart'
    as _i986;
import 'package:ecommerce/featuers/home/data/repositories/home_imply_repo.dart'
    as _i308;
import 'package:ecommerce/featuers/home/domain/repositories/home_contract_repo.dart'
    as _i406;
import 'package:ecommerce/featuers/home/domain/usecases/brands_use_case.dart'
    as _i767;
import 'package:ecommerce/featuers/home/domain/usecases/categories_use_case.dart'
    as _i475;
import 'package:ecommerce/featuers/home/presentation/cubit/home_cubit.dart'
    as _i0;
import 'package:ecommerce/featuers/products/data/datasources/products_remote_api_data_source.dart'
    as _i924;
import 'package:ecommerce/featuers/products/data/repositories/products_imply_repo.dart'
    as _i216;
import 'package:ecommerce/featuers/products/domain/repositories/products_contract_repo.dart'
    as _i510;
import 'package:ecommerce/featuers/products/domain/usecases/products_use_case.dart'
    as _i456;
import 'package:ecommerce/featuers/products/presentation/cubit/products_cubit.dart'
    as _i316;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i986.HomeRemoteDataSource>(
      () => _i143.HomeRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i923.AuthRemoteDataSource>(
      () => _i23.AuthApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i924.ProductsRemoteApiDataSource>(
      () => _i924.ProductsRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i510.ProductsContractRepo>(
      () => _i216.ProductsImplyRepo(gh<_i924.ProductsRemoteApiDataSource>()),
    );
    gh.lazySingleton<_i406.HomeContractRepo>(
      () => _i308.HomeImplyRepo(gh<_i986.HomeRemoteDataSource>()),
    );
    gh.singleton<_i196.AuthLocalDataSource>(
      () => _i107.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i767.BrandsUseCase>(
      () => _i767.BrandsUseCase(gh<_i406.HomeContractRepo>()),
    );
    gh.lazySingleton<_i475.CategoriesUseCase>(
      () => _i475.CategoriesUseCase(gh<_i406.HomeContractRepo>()),
    );
    gh.singleton<_i677.AuthContractRepo>(
      () => _i840.AuthRepository(
        gh<_i923.AuthRemoteDataSource>(),
        gh<_i196.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i456.ProductsUseCase>(
      () => _i456.ProductsUseCase(gh<_i510.ProductsContractRepo>()),
    );
    gh.singleton<_i939.LoginUseCase>(
      () => _i939.LoginUseCase(gh<_i677.AuthContractRepo>()),
    );
    gh.factory<_i0.HomeCubit>(
      () => _i0.HomeCubit(
        gh<_i767.BrandsUseCase>(),
        gh<_i475.CategoriesUseCase>(),
      ),
    );
    gh.singleton<_i790.RegisterUseCase>(
      () => _i790.RegisterUseCase(gh<_i677.AuthContractRepo>()),
    );
    gh.factory<_i316.ProductsCubit>(
      () => _i316.ProductsCubit(gh<_i456.ProductsUseCase>()),
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

class _$RegisterModule extends _i709.RegisterModule {}
