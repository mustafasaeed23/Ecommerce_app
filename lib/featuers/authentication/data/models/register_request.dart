class RegisterRequest {
  final String fullName;
  final String email;
  final String mobileNumber;
  final String password;

  RegisterRequest({
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "name": fullName,
    "email": email,
    "password": password,
    "rePassword": password,
    "phone": mobileNumber,
  };
}
