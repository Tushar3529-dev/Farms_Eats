import 'package:dio/dio.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/data/model/reset_password_model.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/data/model/verify_otp_model.dart';
import '../model/forget_password_model.dart';

class ForgetPasswordApiService {
  static const String baseUrl = 'https://sowlab.com/assignment';
  final Dio _dio = Dio();

  ForgetPasswordApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.options.headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<Map<String, dynamic>> sendOtp(ForgetPasswordModel model) async {
    try {
      final response = await _dio.post(
        "/user/forgot-password",
        data: model.toJson(),
      );

    

      final data = response.data;

      if (data["success"] == true) {
        return data;
      } else {
        throw Exception(data["message"]);
      }

    } on DioException catch (e) {
     

      if (e.response != null && e.response?.data != null) {
        throw Exception(e.response?.data["message"]);
      } else {
        throw Exception("No internet connection");
      }
    }
  }
   Future<Map<String, dynamic>> verifyOtp(VerifyOtpModel model) async {
    try {
      final response = await _dio.post(
        "/user/verify-otp",
        data: model.toJson(),
      );

      

      final data = response.data;

      if (data["success"] == true) {
        return data;
      } else {
        throw Exception(data["message"]);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        throw Exception(e.response?.data["message"]);
      } else {
        throw Exception("No internet connection");
      }
    }
  }
   Future<Map<String, dynamic>> resetPassword(
      ResetPasswordModel model) async {
    try {
      final response = await _dio.post(
        "/user/reset-password",
        data: model.toJson(),
      );

     

      final data = response.data;

      if (data["success"] == true) {
        return data;
      } else {
        throw Exception(data["message"]);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        throw Exception(e.response?.data["message"]);
      } else {
        throw Exception("No internet connection");
      }
    }
  }
}