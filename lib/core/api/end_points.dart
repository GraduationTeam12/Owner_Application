class EndPoint {
  static const String baseUrl = 'https://satars.onrender.com/';
  static const String logIn = 'api/v1/users/login';
  static const String boardData = 'api/v1/users/board-data';
  static const String forgotPassword = 'api/v1/users/forgotPassword';
  static const String sendCode = '/api/v1/users/verifyOtp';
  static const String changeForgottenPassword =
      'api/v1/users/resetPassword';
 

   
}

class ApiKeys {
  static const String id = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String newPassword = 'newPassword';
  static const String confirmPassword = 'passwordConfirm';
  static const String code = 'otp';
  static const String message = 'msg';
  static const String token = 'token';
}
