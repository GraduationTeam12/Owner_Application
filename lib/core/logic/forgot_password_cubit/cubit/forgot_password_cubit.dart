// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';
import 'package:user_app/core/logic/forgot_password_cubit/cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepository) : super(ForgotPasswordInitial());

  final AuthRepository authRepository;
  GlobalKey<FormState> sendCodeKey = GlobalKey();
  TextEditingController emailController = TextEditingController();

  void sendCode() async {
    emit(SendCodeLoading());

    final res = await authRepository.sendCode(emailController.text);
    res.fold((l) => emit(SendCodeError(l)), (r) => emit(SendCodeSucess(r)));
  }

  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> verifyCodeKey = GlobalKey();

  void verifyCode(String email) async {
    emit(VerifyCodeLoading());

    final res = await authRepository.verifyCode(codeController.text, email);
    res.fold(
        (l) => emit(VerifyCodeError(l)), (r) => emit(VerifyCodeSuccess(r)));
  }

  void resetPassword(String email, String password) async {
    emit(ResetPasswordLoading());

    final res = await authRepository.resetPassword(
      email: email,
      password: password,
    );
    res.fold((l) => emit(ResetPasswordError(l)),
        (r) => emit(ResetPasswordSuccess(r)));
  }
}
