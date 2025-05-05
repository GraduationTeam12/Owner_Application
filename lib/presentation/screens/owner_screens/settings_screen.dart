// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/dialog_logout.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                            ? Color(0xFF263238)
                            : MyColors.premiumColor,
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
                        ? Color(0xFF263238)
                        : MyColors.premiumColor,
                    toolbarHeight: MediaQuery.sizeOf(context).height / 9.8,
                    // leading: InkWell(
                    //   onTap: () {
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => HomeScreen(
                    //                   index: 0,
                    //                 )),
                    //         (routes) => false);
                    //   },
                    //   child: Icon(
                    //     Icons.arrow_back,
                    //     color: Colors.white,
                    //     size:
                    //         MediaQuery.sizeOf(context).width > 600 ? 45 : null,
                    //   ),
                    // ),
                    title: Text(
                      LocaleKeys.Drawer_settings.tr(),
                      style: AppStyle.styleBold30(context)
                          .copyWith(color: Colors.white),
                    ),
                    centerTitle: true,
                  ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.sizeOf(context).width,
                decoration: ShapeDecoration(
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Color(0xFF263238)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            context.locale == Locale('en') ? 'Account' : 'الحساب',
                            style: AppStyle.styleBold22(context).copyWith(
                                color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, editProfileScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              context.locale == Locale('en') ? 'Edit Profile' : ' تعديل الملف الشخصي',
                              style: AppStyle.styleRegular22(context).copyWith(
                                  color:
                                      BlocProvider.of<ThemeCubit>(context).isDark
                                          ? Colors.white
                                          : Colors.black),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 8),
                    //     child: Row(
                    //       children: [
                    //         Icon(Icons.key),
                    //         SizedBox(
                    //           width: 5,
                    //         ),
                    //         Text(
                    //           context.locale == Locale('en') ? 'Change Password' : 'تغيير كلمة المرور',
                    //           style: AppStyle.styleRegular22(context).copyWith(
                    //               color:
                    //                   BlocProvider.of<ThemeCubit>(context).isDark
                    //                       ? Colors.white
                    //                       : Colors.black),
                    //         ),
                    //         Spacer(),
                    //         Icon(Icons.arrow_forward_ios)
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, editClosestPeopleScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.refresh_circled),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              context.locale == Locale('en') ? 'Edit Closest people' : ' تعديل الأشخاص المقربين',
                              style: AppStyle.styleRegular22(context).copyWith(
                                  color:
                                      BlocProvider.of<ThemeCubit>(context).isDark
                                          ? Colors.white
                                          : Colors.black),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                context.locale == Locale('en') ? 'Other Settings' : 'الإعدادات الأخرى',
                style: AppStyle.styleBold22(context).copyWith(
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Colors.white
                        : Colors.black),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: ShapeDecoration(
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Color(0xFF263238)
                        : Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          BlocProvider.of<ThemeCubit>(context).isDark
                              ? Icon(Icons.dark_mode)
                              : Icon(Icons.light_mode),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            context.locale == Locale('en') ? 'Dark Mode' : ' الوضع المظلم',
                            style: AppStyle.styleRegular22(context).copyWith(
                                color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Spacer(),
                          Switch(
                              activeColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              value: BlocProvider.of<ThemeCubit>(context).isDark,
                              onChanged: (bool value) {
                                setState(() {
                                  BlocProvider.of<ThemeCubit>(context)
                                      .changeTheme();
                                });
                              })
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, languagesScreen);
                          },
                          child: Row(
                            children: [
                              BlocProvider.of<ThemeCubit>(context).isDark
                                  ? SvgPicture.asset(
                                      Assets.imagesAuthImagesLanguageDarkMode)
                                  : SvgPicture.asset(
                                      Assets.imagesAuthImagesEditLanguages),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                context.locale == Locale('en') ? 'Languages' : ' اللغات',
                                style: AppStyle.styleRegular22(context).copyWith(
                                    color: BlocProvider.of<ThemeCubit>(context)
                                            .isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              Spacer(),
                              Text(
                                context.locale.languageCode == 'en'
                                    ? '(English)'
                                    : '(العربية)',
                                style: AppStyle.styleRegular20(context).copyWith(
                                    fontFamily: 'Roboto',
                                    color: BlocProvider.of<ThemeCubit>(context)
                                            .isDark
                                        ? Colors.white
                                        : null),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.sizeOf(context).width > 600 ? 70 : null,
                        width: context.locale.languageCode == 'ar' &&
                                MediaQuery.sizeOf(context).width > 600
                            ? 350
                            : context.locale.languageCode == 'ar' &&
                                    MediaQuery.sizeOf(context).width < 600
                                ? 200
                                : MediaQuery.sizeOf(context).width > 600
                                    ? 250
                                    : 150,
                        child: ElevatedButton(
                          onPressed: () {
                            showLogOutDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFFA8A1A1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.black,
                                size: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 24,
                              ),
                              const SizedBox(width: 10),
                              FittedBox(
                                child: Text(
                                  LocaleKeys.Drawer_logout.tr(),
                                  style: AppStyle.styleRegular20(context)
                                      .copyWith(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
