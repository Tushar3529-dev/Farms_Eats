

import 'package:dio/dio.dart';
import 'package:software_lab/features/authentication/screens/SignUp/data/model/sign_up_model.dart';

class SignUpApiService {
  static const String baseUrl = 'https://sowlab.com/assignment';
  final Dio _dio = Dio();

  SignUpApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.options.headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

 
  Future<Map<String, dynamic>> registerUser(SignupModel model) async {
    try {
      final response = await _dio.post(
        "/user/register",
        data: model.toJson(),
      );

   
      final data = response.data;

     
      if (data["success"] == true) {
        return data;
      } else {
       
        throw Exception(data["message"] ?? "Signup failed");
      }
    } on DioException catch (e) {
    

      if (e.response != null && e.response?.data != null) {
        final errorData = e.response?.data;

        throw Exception(errorData["message"] ?? "Network error");
      } else {
        throw Exception("No internet connection");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}