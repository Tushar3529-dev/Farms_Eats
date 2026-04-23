class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,

      
      "role": "farmer",
      "device_token": "0imfnctushahdweuhduewihdwiud8mVLW",
      "type": "email",
      "social_id": "A0yadavhwejdhjwDDqtlx",
    };
  }
}