// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_constants.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';

class SelectLanguagesScreen extends StatefulWidget {
  const SelectLanguagesScreen({super.key});

  @override
  State<SelectLanguagesScreen> createState() => _SelectLanguagesScreenState();
}

class _SelectLanguagesScreenState extends State<SelectLanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF263238) : MyColors.premiumColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF263238) : MyColors.premiumColor,
        toolbarHeight: MediaQuery.sizeOf(context).height / 9.8,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: MediaQuery.sizeOf(context).width > 600 ? 45 : null,
          ),
        ),
        title: Text(
          'Select Language',
          style: AppStyle.styleBold30(context).copyWith(
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF1E1E1E) : Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                context.setLocale(Locale('en'));
                AppConstants.lang = context.locale.languageCode;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "English",
                    style: AppStyle.styleSemiBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Color(0xFF5C5858)),
                  ),
                  context.locale.languageCode == 'en'
                      ? Icon(Icons.check)
                      : Text('')
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(thickness: 1, color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.grey : MyColors.premiumColor)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                context.setLocale(Locale('ar'));
                AppConstants.lang = context.locale.languageCode;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "العربية",
                    style: AppStyle.styleSemiBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Color(0xFF5C5858)),
                  ),
                  context.locale.languageCode == 'ar'
                      ? Icon(Icons.check)
                      : Text('')
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(thickness: 1, color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.grey : MyColors.premiumColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
