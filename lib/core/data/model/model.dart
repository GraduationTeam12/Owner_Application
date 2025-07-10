import 'package:user_app/core/api/end_points.dart';

class LoginModel {
  final String message;
  final String token;
  final String userName;
  final String address;
  final String email;
  LoginModel({
    required this.message,
    required this.token,
    required this.userName,
    required this.address,
    required this.email,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
        message: jsonData[ApiKeys.message],
        token: jsonData[ApiKeys.token],
        userName: jsonData['data']['username'],
        address: jsonData['data']['address'],
        email: jsonData['data']['email'] ,
        );

  }
}
