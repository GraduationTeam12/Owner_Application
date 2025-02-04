import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/forgot_password_email_field.dart';

class AddMemberForm extends StatelessWidget {
  const AddMemberForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          )),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Authentication_firstMemeber.tr(),
                style: AppStyle.styleSemiBold22(context)
                    .copyWith(color: Color(0xFF979797)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: AppStyle.styleRegular17(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    errorStyle: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.red),
                    prefixIcon: Padding(
                      padding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.all(0),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                      ),
                    ),
                    labelText: LocaleKeys.Authentication_fullName.tr(),
                    labelStyle: AppStyle.styleRegular17(context),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(width: 0.5)),
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
                // validator: (email) {
                //   if (email!.isEmpty) {
                //     return "Please enter your email";
                //   }
                //   return null;
                // },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: AppStyle.styleRegular17(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    errorStyle: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.red),
                    prefixIcon: Padding(
                      padding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.all(0),
                      child: Icon(
                        Icons.phone_iphone,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                      ),
                    ),
                    labelText: LocaleKeys.Authentication_phoneNumber.tr(),
                    labelStyle: AppStyle.styleRegular17(context),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(width: 0.5)),
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
                // validator: (email) {
                //   if (email!.isEmpty) {
                //     return "Please enter your email";
                //   }
                //   return null;
                // },
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                LocaleKeys.Authentication_secondMemeber.tr(),
                style: AppStyle.styleSemiBold22(context)
                    .copyWith(color: Color(0xFF979797)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: AppStyle.styleRegular17(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    errorStyle: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.red),
                    prefixIcon: Padding(
                      padding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.all(0),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                      ),
                    ),
                    labelText: LocaleKeys.Authentication_fullName.tr(),
                    labelStyle: AppStyle.styleRegular17(context),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(width: 0.5)),
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
                // validator: (email) {
                //   if (email!.isEmpty) {
                //     return "Please enter your email";
                //   }
                //   return null;
                // },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: AppStyle.styleRegular17(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    errorStyle: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.red),
                    prefixIcon: Padding(
                      padding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.all(0),
                      child: Icon(
                        Icons.phone_iphone,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                      ),
                    ),
                    labelText: LocaleKeys.Authentication_phoneNumber.tr(),
                    labelStyle: AppStyle.styleRegular17(context),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(width: 0.5)),
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
                // validator: (email) {
                //   if (email!.isEmpty) {
                //     return "Please enter your email";
                //   }
                //   return null;
                // },
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width > 600 ? 230 : 150,
                    height: MediaQuery.sizeOf(context).width > 600 ? 80 : 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.premiumColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, carSplashScreen);
                        },
                        child: Text(
                          LocaleKeys.Authentication_add.tr(),
                          style: AppStyle.styleBold20(context)
                              .copyWith(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width > 600 ? 30 : 15,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width > 600 ? 230 : 150,
                    height: MediaQuery.sizeOf(context).width > 600 ? 80 : 50,
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 0.5, color: MyColors.premiumColor),
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, carSplashScreen);
                        },
                        child: Text(
                          LocaleKeys.Authentication_skip.tr(),
                          style: AppStyle.styleBold20(context)
                              .copyWith(color: MyColors.premiumColor),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
