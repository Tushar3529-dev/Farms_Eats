class ResetPasswordModel {
  final String token;
  final String password;
  final String cpassword;

  ResetPasswordModel({
    required this.token,
    required this.password,
    required this.cpassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "password": password,
      "cpassword": cpassword,
    };
  }
}