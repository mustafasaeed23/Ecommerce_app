import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  String getToken();
  Future<void> saveUser(UserEntity user);
  UserEntity? getUser();
  Future<void> clear();
}
