import 'package:dio/dio.dart';
import 'package:software_lab/features/authentication/screens/Login/data/model/login_model.dart';


class LoginApiService {
  static const String baseUrl = 'https://sowlab.com/assignment';
  final Dio _dio = Dio();

  LoginApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.options.headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

 
  Future<Map<String, dynamic>> loginUser(LoginModel model) async {
    try {
      final response = await _dio.post(
        "/user/login",
        data: model.toJson(),
      );

      

      final data = response.data;

      
      if (data["success"] == true) {
        return data;
      } else {
        throw Exception(data["message"] ?? "Login failed");
      }

    } on DioException catch (e) {
     

      if (e.response != null && e.response?.data != null) {
        throw Exception(e.response?.data["message"] ?? "Network error");
      } else {
        throw Exception("No internet connection");
      }

    } catch (e) {
      throw Exception(e.toString());
    }
  }
}