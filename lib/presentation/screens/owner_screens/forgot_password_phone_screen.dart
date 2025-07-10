import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/custom_app_bar.dart';
import 'package:user_app/presentation/widgets/forgot_password_phone_field.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildCustomAppBar(context, LocaleKeys.Authentication_forgotPassword.tr()),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width > 600
                          ? MediaQuery.sizeOf(context).width / 2
                          : null,
                      height: MediaQuery.sizeOf(context).width > 600
                          ? MediaQuery.of(context).size.height / 3
                          : null,
                        child: SvgPicture.asset(
                            Assets.imagesAuthImagesForgotPassword,
                            fit: BoxFit.contain,
                            ),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        children:

                      context.locale.languageCode == 'ar' ? [
                          FittedBox(
                                    child: Text(
                                        'من فضلك ادخل رقم الجوال الخاص بك لتلقي رمز التحقق',
                                        style: AppStyle.styleSemiBold25(context)
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5C5858),
                                        ))),
                        ] : 
                        
                        [
                          FittedBox(
                            child: Text(
                              "Please enter your phone number to",
                              style: AppStyle.styleRegular17(context)
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          FittedBox(
                              child: Text("receive a verification code",
                                  style: AppStyle.styleRegular17(context)
                                      .copyWith(fontWeight: FontWeight.w600))),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const ForgotPasswordByPhoneField(),
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: SizedBox(height: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
