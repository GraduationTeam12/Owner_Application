// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF1E1E1E) : Colors.white,
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
          LocaleKeys.NotificationsPage_appbar.tr(),
          style: AppStyle.styleBold30(context).copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height:
                            MediaQuery.sizeOf(context).width > 600 ? 200 : 100,
                        decoration: ShapeDecoration(
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              )
                            ],
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF263238) : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Image.asset(
                                  'assets/images/auth_images/Error.png'),
                              SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                child: Text(
                                  LocaleKeys.NotificationsPage_title.tr(),
                                  style:
                                      AppStyle.styleRegular20(context).copyWith(
                                    color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Colors.black,
                                  ),
                                  maxLines: null,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
