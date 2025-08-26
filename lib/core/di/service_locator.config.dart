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
import 'package:ecommerce/featuers/address/data/datasources/address_remote_api_data_source.dart'
    as _i577;
import 'package:ecommerce/featuers/address/data/datasources/address_remote_data_source.dart'
    as _i332;
import 'package:ecommerce/featuers/address/data/repositories/address_imply_repo.dart'
    as _i964;
import 'package:ecommerce/featuers/address/domain/repositories/address_contract_repo.dart'
    as _i870;
import 'package:ecommerce/featuers/address/domain/usecases/get_user_address_use_case.dart'
    as _i891;
import 'package:ecommerce/featuers/address/presentation/cubit/address_cubit.dart'
    as _i420;
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
import 'package:ecommerce/featuers/cart/data/datasources/cart_remote_api_data_source.dart'
    as _i933;
import 'package:ecommerce/featuers/cart/data/datasources/cart_remote_data_source.dart'
    as _i57;
import 'package:ecommerce/featuers/cart/data/repositories/cart_imply_repo.dart'
    as _i659;
import 'package:ecommerce/featuers/cart/domain/repositories/cart_contract_repo.dart'
    as _i957;
import 'package:ecommerce/featuers/cart/domain/usecases/add_to_cart_use_case.dart'
    as _i854;
import 'package:ecommerce/featuers/cart/domain/usecases/delete_item_use_case.dart'
    as _i731;
import 'package:ecommerce/featuers/cart/domain/usecases/get_cart_use_case.dart'
    as _i848;
import 'package:ecommerce/featuers/cart/domain/usecases/update_cart_use_case.dart'
    as _i714;
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart'
    as _i716;
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
import 'package:ecommerce/featuers/orders/data/datasources/orders_remote_api_data_source.dart'
    as _i684;
import 'package:ecommerce/featuers/orders/data/datasources/orders_remote_data_source.dart'
    as _i1058;
import 'package:ecommerce/featuers/orders/data/repositories/orders_imply_repo.dart'
    as _i1046;
import 'package:ecommerce/featuers/orders/domain/repositories/orders_contract_repo.dart'
    as _i379;
import 'package:ecommerce/featuers/orders/domain/usecases/get_all_orders_use_case.dart'
    as _i976;
import 'package:ecommerce/featuers/orders/presentation/cubit/orders_cubit.dart'
    as _i196;
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
import 'package:ecommerce/featuers/profile/cubit/profile_cubit.dart' as _i789;
import 'package:ecommerce/featuers/wishlist/data/datasources/wishlist_remote_api_data_source.dart'
    as _i754;
import 'package:ecommerce/featuers/wishlist/data/datasources/wishlist_remote_data_source.dart'
    as _i195;
import 'package:ecommerce/featuers/wishlist/data/repositories/wishlist_imply_repo.dart'
    as _i951;
import 'package:ecommerce/featuers/wishlist/domain/repositories/wishlist_contract_repo.dart'
    as _i365;
import 'package:ecommerce/featuers/wishlist/domain/usecases/add_to_wishlist_use_case.dart'
    as _i354;
import 'package:ecommerce/featuers/wishlist/domain/usecases/get_user_wishlist_use_case.dart'
    as _i250;
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_cubit.dart'
    as _i741;
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
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i923.AuthRemoteDataSource>(
      () => _i23.AuthApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i332.AddressRemoteDataSource>(
      () => _i577.AddressRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i195.WishlistRemoteDataSource>(
      () => _i754.WishlistRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i57.CartRemoteDataSource>(
      () => _i933.CartRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i924.ProductsRemoteApiDataSource>(
      () => _i924.ProductsRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1058.OrdersRemoteDataSource>(
      () => _i684.OrdersRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i510.ProductsContractRepo>(
      () => _i216.ProductsImplyRepo(gh<_i924.ProductsRemoteApiDataSource>()),
    );
    gh.singleton<_i196.AuthLocalDataSource>(
      () => _i107.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i870.AddressContractRepo>(
      () => _i964.AddressImplyRepo(gh<_i332.AddressRemoteDataSource>()),
    );
    gh.lazySingleton<_i986.HomeRemoteDataSource>(
      () => _i143.HomeRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i957.CartContractRepo>(
      () => _i659.CartImplyRepo(gh<_i57.CartRemoteDataSource>()),
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
    gh.lazySingleton<_i379.OrdersContractRepo>(
      () => _i1046.OrdersImplyRepo(gh<_i1058.OrdersRemoteDataSource>()),
    );
    gh.lazySingleton<_i365.WishlistContractRepo>(
      () => _i951.WishlistImplyRepo(gh<_i195.WishlistRemoteDataSource>()),
    );
    gh.singleton<_i790.RegisterUseCase>(
      () => _i790.RegisterUseCase(gh<_i677.AuthContractRepo>()),
    );
    gh.factory<_i789.ProfileCubit>(
      () => _i789.ProfileCubit(gh<_i196.AuthLocalDataSource>()),
    );
    gh.lazySingleton<_i406.HomeContractRepo>(
      () => _i308.HomeImplyRepo(gh<_i986.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i976.GetAllOrdersUseCase>(
      () => _i976.GetAllOrdersUseCase(gh<_i379.OrdersContractRepo>()),
    );
    gh.lazySingleton<_i767.BrandsUseCase>(
      () => _i767.BrandsUseCase(gh<_i406.HomeContractRepo>()),
    );
    gh.lazySingleton<_i475.CategoriesUseCase>(
      () => _i475.CategoriesUseCase(gh<_i406.HomeContractRepo>()),
    );
    gh.factory<_i196.OrdersCubit>(
      () => _i196.OrdersCubit(gh<_i976.GetAllOrdersUseCase>()),
    );
    gh.lazySingleton<_i891.GetUserAddressUseCase>(
      () => _i891.GetUserAddressUseCase(gh<_i870.AddressContractRepo>()),
    );
    gh.factory<_i316.ProductsCubit>(
      () => _i316.ProductsCubit(gh<_i456.ProductsUseCase>()),
    );
    gh.lazySingleton<_i848.GetCartUseCase>(
      () => _i848.GetCartUseCase(gh<_i957.CartContractRepo>()),
    );
    gh.lazySingleton<_i854.AddToCartUseCase>(
      () => _i854.AddToCartUseCase(gh<_i957.CartContractRepo>()),
    );
    gh.lazySingleton<_i714.UpdateCartUseCase>(
      () => _i714.UpdateCartUseCase(gh<_i957.CartContractRepo>()),
    );
    gh.lazySingleton<_i731.DeleteItemUseCase>(
      () => _i731.DeleteItemUseCase(gh<_i957.CartContractRepo>()),
    );
    gh.factory<_i420.AddressCubit>(
      () => _i420.AddressCubit(gh<_i891.GetUserAddressUseCase>()),
    );
    gh.singleton<_i766.AuthCubit>(
      () => _i766.AuthCubit(
        gh<_i939.LoginUseCase>(),
        gh<_i790.RegisterUseCase>(),
      ),
    );
    gh.factory<_i716.CartCubit>(
      () => _i716.CartCubit(
        gh<_i848.GetCartUseCase>(),
        gh<_i854.AddToCartUseCase>(),
        gh<_i714.UpdateCartUseCase>(),
        gh<_i731.DeleteItemUseCase>(),
      ),
    );
    gh.lazySingleton<_i250.GetUserWishlistUseCase>(
      () => _i250.GetUserWishlistUseCase(gh<_i365.WishlistContractRepo>()),
    );
    gh.lazySingleton<_i354.AddToWishlistUseCase>(
      () => _i354.AddToWishlistUseCase(gh<_i365.WishlistContractRepo>()),
    );
    gh.factory<_i0.HomeCubit>(
      () => _i0.HomeCubit(
        gh<_i767.BrandsUseCase>(),
        gh<_i475.CategoriesUseCase>(),
      ),
    );
    gh.factory<_i741.WishlistCubit>(
      () => _i741.WishlistCubit(
        gh<_i250.GetUserWishlistUseCase>(),
        gh<_i354.AddToWishlistUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
