import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:user_app/core/api/api_consumer.dart';
import 'package:user_app/core/api/end_points.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/data/model/closest_people_model.dart';
import 'package:user_app/core/data/model/model.dart';
import 'package:user_app/core/error/exceptions.dart';
import 'package:user_app/presentation/widgets/device_id_and_device_info.dart';

class AuthRepository {
  final ApiConsumer apiConsumer;

  AuthRepository({required this.apiConsumer});

  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
    required String? fcmToken,
  }) async {
    try {
      final deviceDetails = await getDeviceDetails();
      final response = await apiConsumer.post(
        EndPoint.logIn,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
          "fcmToken": {
            "token": fcmToken,
            "deviceId": deviceDetails['deviceId'],
            "deviceInfo":
                "${deviceDetails['manufacturer']} ${deviceDetails['model']}"
          }
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
      final response = await apiConsumer.post(
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

  Future<Either<String, String>> addEmergencyContacts(
      String name1, String phone1, String name2, String phone2) async {
    final String? token = await CacheHelper().getData(key: "token");

    try {
      final response = await apiConsumer.post(
        EndPoint.addEmergencyContacts,
        data: {
          "emergencyContacts": [
            {"name": name1, "phone": phone1},
            {"name": name2, "phone": phone2}
          ]
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ClosestPersonModel>>>
      getEmergencyContacts() async {
    final String? token = await CacheHelper().getData(key: "token");

    try {
      final response = await apiConsumer.get(
        EndPoint.addEmergencyContacts,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right((response["contacts"] as List<dynamic>)
          .map((contact) => ClosestPersonModel.fromJson(contact)).toList());
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> updateUserInfo(
    String username,
    String address,
  ) async {
    final String? token = await CacheHelper().getData(key: "token");

    try {
      final response = await apiConsumer.put(
        EndPoint.updateUserInfo,
        data: {"username": username, "address": address},
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> logout() async {
    final String? token = await CacheHelper().getData(key: "token");
    final deviceDetails = await getDeviceDetails();
    try {
      final response = await apiConsumer.post(
        EndPoint.logOut,
        data: {
          "deviceId": deviceDetails['deviceId'],
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
