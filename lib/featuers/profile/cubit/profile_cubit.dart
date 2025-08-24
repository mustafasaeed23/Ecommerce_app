import 'package:bloc/bloc.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';
import 'package:ecommerce/featuers/profile/cubit/profile_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.localDataSource) : super(ProfileInitial());

  final AuthLocalDataSource localDataSource;

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      final user = localDataSource.getUser();
      final token = localDataSource.getToken();
      print("token in profile cubit: $token");
      print("user in profile cubit: $user");
      if (user != null) {
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError(message: "No user found"));
      }
    } catch (e) {
      emit(ProfileError(message: "Failed to load profile"));
    }
  }

  Future<void> setFromAuth(UserEntity user) async {
    await localDataSource.saveUser(user);
    emit(ProfileLoaded(user));
  }
}
