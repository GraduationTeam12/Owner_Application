import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:user_app/core/api/api_consumer.dart';
import 'package:user_app/core/api/end_points.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/data/model/closest_people_model.dart';
import 'package:user_app/core/data/model/model.dart';
import 'package:user_app/core/error/exceptions.dart';

class AuthRepository {
  final ApiConsumer apiConsumer;

  AuthRepository({required this.apiConsumer});

  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
    required String? fcmToken,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.logIn,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
          'fcmToken': fcmToken
        },
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await apiConsumer
          .post(EndPoint.forgotPassword, data: {ApiKeys.email: email});
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> verifyCode(String code, String email) async {
    try {
      final response = await apiConsumer.post(EndPoint.sendCode,
          data: {ApiKeys.code: code, ApiKeys.email: email});
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> resetPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.patch(
        EndPoint.changeForgottenPassword,
        data: jsonEncode({
          "email": email,
          "newPassword": password,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>> getBoardData() async {
    final String? token = await CacheHelper().getData(key: "token");

    if (token == null) {
      return Left("❌ Token is missing!");
    }
    // final String token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3OWJhNWRhNDY3NTM2MDdlMDQ4MTIwMyIsImlhdCI6MTczODc2NDQ2NywiZXhwIjoxODMzNDM3MjY3fQ.3D4Zxmo6xm_G830ldm42rmn-TGKrCfmvyxcq_Usyb9o';
    try {
      final response = await apiConsumer.get(
        EndPoint.boardData,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      // BoardModel boardModel = BoardModel.fromJson(response);

      return Right(response);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<bool> addEmergencyContacts(List<Map<String, dynamic>> contacts) async {
    const String url = "https://satars.onrender.com/api/v1/users/contacts";
    String token = await CacheHelper().getData(key: "token");

    try {
      Response response = await Dio().post(
        url,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        }),
        data: {
          "emergencyContacts": contacts,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("تمت إضافة جهات الاتصال بنجاح");
        return true;
      } else {
        print("فشل الإضافة: ${response.statusMessage}");
        return false;
      }
    } catch (e) {
      print("خطأ أثناء الإرسال: $e");
      return false;
    }
  }

  Future<Either<String, List<ClosestPersonModel>>> getClosestPeople() async {
    final String? token = await CacheHelper().getData(key: "token");

    if (token == null) {
      return Left("❌ Token is missing!");
    }

    try {
      final response = await apiConsumer.get(
        "https://satars.onrender.com/api/v1/users/contacts",
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      // التحقق من أن `contacts` موجودة في الـ response
      if (response.containsKey("contacts") && response["contacts"] is List) {
        List<ClosestPersonModel> people = (response["contacts"] as List)
            .map((json) => ClosestPersonModel.fromJson(json))
            .toList();

        return Right(people);
      } else {
        return Left("❌ Unexpected response format");
      }
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
