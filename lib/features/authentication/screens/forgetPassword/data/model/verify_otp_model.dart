class VerifyOtpModel {
  final String otp;

  VerifyOtpModel({required this.otp});

  Map<String, dynamic> toJson() {
    return {
      "otp": otp,
    };
  }
}