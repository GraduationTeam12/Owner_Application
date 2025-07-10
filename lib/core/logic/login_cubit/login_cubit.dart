// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:user_app/core/api/end_points.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/data/model/model.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';
import 'package:user_app/presentation/widgets/get_fcmtoken.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepository authRepo;
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();

  LoginModel? loginModel;
  void login() async {
    emit(LoginLoadingState());

    final result = await authRepo.login(
        email: signInEmail.text,
        password: signInPassword.text,
        fcmToken: PushNotificationsService.token);

    result.fold((l) => emit(LoginErrorState(errMsg: l)), (r) async {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
      await CacheHelper().saveData(key: ApiKeys.token, value: r.token);
      await CacheHelper()
          .saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      await CacheHelper()
          .saveData(key: 'userName', value: r.userName);
      await CacheHelper()
          .saveData(key: 'address', value: r.address);

      await CacheHelper()
          .saveData(key: 'email', value: r.email);
    final contactsRes = await authRepo.getEmergencyContacts();

    contactsRes.fold(
      (error) async {
        await CacheHelper().removeData(key: "AddMemberScreen");
      },
      (contacts) async {
        if (contacts.length >= 2) {
          await CacheHelper().saveData(key: "AddMemberScreen", value: true);
        } else {
          await CacheHelper().removeData(key: "AddMemberScreen");
        }
      },
    );
          log("Dataaaaaaaaaaaaaaaa  ${r.userName} ${r.address} ${r.email}");
      loginModel = r;
      emit(LoginSuccessState(message: r.message));
    });
  }
}
