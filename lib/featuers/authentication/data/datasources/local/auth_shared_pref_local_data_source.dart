import 'dart:convert';

import 'package:ecommerce/core/constants/cache_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:ecommerce/featuers/authentication/data/models/user_model.dart';
import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final SharedPreferences sharedPrefs;

  AuthSharedPrefLocalDataSource(this.sharedPrefs);

  @override
  Future<void> saveToken(String token) async {
    try {
      await sharedPrefs.setString(CacheConstants.tokenKey, token);
    } catch (exception) {
      throw LocalException("Failed To Save Token!");
    }
  }

  @override
  String getToken() {
    try {
      return sharedPrefs.getString(CacheConstants.tokenKey)!;
    } catch (_) {
      throw LocalException("Failed To Get Token!");
    }
  }

  @override
  UserEntity? getUser() {
    try {
      final s = sharedPrefs.getString(CacheConstants.userKey);
      if (s == null) return null;
      final map = jsonDecode(s) as Map<String, dynamic>;
      return UserModel.fromJson(map);
    } catch (_) {
      // If parsing fails, treat as no user
      return null;
    }
  }

  @override
  Future<void> clear() async {
    await sharedPrefs.remove(CacheConstants.tokenKey);
    await sharedPrefs.remove(CacheConstants.userKey);
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    final json = UserModel.fromEntity(user).toJson();
    final userSaved = await sharedPrefs.setString(
      CacheConstants.userKey,
      jsonEncode(json),
    );
    if (!userSaved) throw LocalException("Failed To Save User!");
  }
}
