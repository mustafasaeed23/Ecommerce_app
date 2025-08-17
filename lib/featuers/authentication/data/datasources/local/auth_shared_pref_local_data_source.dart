import 'package:ecommerce/core/constants/cache_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString(CacheConstants.tokenKey, token);
    } catch (exception) {
      throw LocalException("Failed To Save Token!");
    }
  }

  @override
  Future<String> getToken() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString(CacheConstants.tokenKey)!;
    } catch (_) {
      throw LocalException("Failed To Get Token!");
    }
  }
}
