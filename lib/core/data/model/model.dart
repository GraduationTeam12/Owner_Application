 

import 'package:user_app/core/api/end_points.dart';

class LoginModel {
  final String message;
  final String token;

  LoginModel({
    required this.message,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
        message: jsonData[ApiKeys.message], token: jsonData[ApiKeys.token]);
  }
}