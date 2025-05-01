// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/logic/login_cubit/login_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/loading_dialog.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isVisable = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showLoadingDialog(context);
        }
        if (state is LoginSuccessState) {
          // String message = state.message;
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(message)));

          Navigator.pop(context);
          final visitedPage = CacheHelper().getData(key: 'AddMemberScreen');
          visitedPage == null
              ? Navigator.pushReplacementNamed(context, addMembersScreen)
              : Navigator.pushReplacementNamed(context, homePageScreen);
        }
        if (state is LoginErrorState) {
          Navigator.pop(context);
          String message = state.errMsg;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<LoginCubit>(context).loginKey,
          child: Column(
            children: [
              TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                    errorStyle: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.red),
                    prefixIcon: Padding(
                      padding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.all(0),
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                      ),
                    ),
                    labelText: LocaleKeys.Authentication_email.tr(),
                    labelStyle: AppStyle.styleRegular16(context),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    floatingLabelStyle: AppStyle.styleRegular16(context)
                        .copyWith(
                            color: MyColors.premiumColor,
                            fontWeight: FontWeight.w600),
                    contentPadding: MediaQuery.sizeOf(context).width > 600
                        ? const EdgeInsets.all(30)
                        : const EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    border: buildBorder()),
                validator: (email) {
                  if (email!.isEmpty) {
                    return context.locale.languageCode == 'ar' ? 'من فضلك ادخل بريدك الالكتروني'  :"Please enter your email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: isVisable ? true : false,
                controller: BlocProvider.of<LoginCubit>(context).signInPassword,
                decoration: InputDecoration(
                    errorStyle: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.red),
                    prefixIcon: Padding(
                      padding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.all(0),
                      child: Icon(
                        Icons.lock_outlined,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                      ),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: isVisable
                            ? Icon(
                                Icons.visibility,
                                size: MediaQuery.sizeOf(context).width > 600
                                    ? 45
                                    : 25,
                              )
                            : Icon(
                                Icons.visibility_off,
                                size: MediaQuery.sizeOf(context).width > 600
                                    ? 45
                                    : 25,
                              )),
                    labelText: LocaleKeys.Authentication_password.tr(),
                    labelStyle: AppStyle.styleRegular16(context),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    floatingLabelStyle: AppStyle.styleRegular16(context)
                        .copyWith(
                            color: MyColors.premiumColor,
                            fontWeight: FontWeight.w600),
                    contentPadding: MediaQuery.sizeOf(context).width > 600
                        ? const EdgeInsets.all(30)
                        : const EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    border: buildBorder()),
                validator: (password) {
                  if (password!.isEmpty) {
                    return context.locale.languageCode == 'ar' ? 'من فضلك ادخل كلمة المرور'  : "Please enter your password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, forgotPasswordEmailScreen);
                    },
                    child: Text(
                      LocaleKeys.Authentication_forgotPassword.tr(),
                      style: AppStyle.styleSemiBold16(context)
                          .copyWith(color: MyColors.premiumColor),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).width > 600 ? 70 : 47,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!BlocProvider.of<LoginCubit>(context)
                          .loginKey
                          .currentState!
                          .validate()) {
                        return;
                      } else {
                        BlocProvider.of<LoginCubit>(context).login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.premiumColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      LocaleKeys.Authentication_login.tr(),
                      style: AppStyle.styleSemiBold18(context),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(width: 1));
  }
}
