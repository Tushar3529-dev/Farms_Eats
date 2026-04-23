class ForgetPasswordModel {
  final String mobile;

  ForgetPasswordModel({required this.mobile});

  Map<String, dynamic> toJson() {
    return {
      "mobile": mobile,
    };
  }
}