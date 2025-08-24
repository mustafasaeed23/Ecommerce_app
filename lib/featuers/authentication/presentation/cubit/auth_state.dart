abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthChecking extends AuthState {}            // splash / boot
class AuthAuthenticated extends AuthState {}       // user already logged in
class AuthUnauthenticated extends AuthState {}  

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
    final String message;

  RegisterError(this.message);
}
