import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_constants.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/logic/forgot_password_cubit/cubit/forgot_password_cubit.dart';
import 'package:user_app/core/logic/forgot_password_cubit/cubit/forgot_password_state.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/custom_elevated_button.dart';

class ForgotPasswordEmailField extends StatefulWidget {
  const ForgotPasswordEmailField({
    super.key,
  });

  @override
  State<ForgotPasswordEmailField> createState() =>
      ForgotPasswordEmailFieldState();
}

class ForgotPasswordEmailFieldState extends State<ForgotPasswordEmailField> {
  // final emailController = TextEditingController();

  static late String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is SendCodeLoading) {
          const CircularProgressIndicator(
            backgroundColor: Colors.amber,
          );
        }

        if (state is SendCodeSucess) {
          Navigator.of(context)
              .pushReplacementNamed(resetPasswordEmailScreen, arguments: email);
        }

        if (state is SendCodeError) {
          String message = state.errMessage;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<ForgotPasswordCubit>(context).sendCodeKey,
          child: Column(
            children: [
              TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<ForgotPasswordCubit>(context)
                    .emailController,
                decoration: InputDecoration(
                    errorStyle: AppStyle.styleRegular16(context).copyWith(color: Colors.red),
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
                    // hintText: "E-mail",
                    // hintStyle: AppStyle.styleRegular16(context),
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
                    return AppConstants.lang == 'ar' ? 'من فضلك ادخل بريدك الالكتروني'  : "Please enter your email";
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomElevatedButton(
                  title: LocaleKeys.Authentication_sendCode.tr(),
                  onPressed: () {
                    if (!BlocProvider.of<ForgotPasswordCubit>(context)
                        .sendCodeKey
                        .currentState!
                        .validate()) {
                      return;
                    } else {
                      BlocProvider.of<ForgotPasswordCubit>(context)
                          .sendCodeKey
                          .currentState!
                          .save();
                      BlocProvider.of<ForgotPasswordCubit>(context).sendCode();
                    }
                  }),
              const SizedBox(
                height: 18,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, forgotPasswordPhoneScreen);
                  },
                  child: Text(
                    LocaleKeys.Authentication_tryAnotherWay.tr(),
                    style: AppStyle.styleBold17(context).copyWith(
                      color: const Color(0xFF3D6498),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1));
}
