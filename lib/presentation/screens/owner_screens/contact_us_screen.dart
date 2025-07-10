// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
          LocaleKeys.ContactAdmin_appbar.tr(),
          style: AppStyle.styleBold30(context).copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
          ? Color(0xFF1E1E1E)
          : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.ContactAdmin_headerText.tr(),
                      style: AppStyle.styleSemiBold25(context).copyWith(
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                              ? Colors.white
                              : Colors.black)),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(LocaleKeys.ContactAdmin_contactAdmin.tr(),
                      style: AppStyle.styleSemiBold20(context).copyWith(
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                              ? Colors.white
                              : Color(0xFF5C5858))),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).width > 600
                              ? 350
                              : 200,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                              shadows: const [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    color: Color.fromRGBO(0, 0, 0, 0.2))
                              ],
                              color: BlocProvider.of<ThemeCubit>(context).isDark
                                  ? Color(0xFF263238)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          child: TextFormField(
                            maxLines: null,
                            style: AppStyle.styleRegular16(context).copyWith(
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? Colors.white
                                        : Colors.black),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                errorStyle: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.red),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),
                                hintText: LocaleKeys.ContactAdmin_message.tr(),
                                hintStyle: AppStyle.styleRegular17(context)
                                    .copyWith(
                                        color:
                                            BlocProvider.of<ThemeCubit>(context)
                                                    .isDark
                                                ? Colors.white
                                                : null),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width > 600
                          ? 500
                          : double.infinity,
                      height: MediaQuery.sizeOf(context).width > 600 ? 80 : 55,
                      child: ElevatedButton(
                        onPressed: () async {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : MyColors.premiumColor,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.ContactAdmin_button.tr(),
                          style: AppStyle.styleRegular25(context).copyWith(
                              fontFamily: 'Inter', color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF263238) : Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                              color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.grey : Colors.black,
                              thickness: MediaQuery.sizeOf(context).width > 600
                                  ? 2
                                  : 1,
                              height: 1),
                        ),
                      ),
                      Text(LocaleKeys.ContactAdmin_or.tr(),
                          style: AppStyle.styleRegular25(context).copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : null)),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                              color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.grey : Colors.black,
                              thickness: MediaQuery.sizeOf(context).width > 600
                                  ? 2
                                  : 1,
                              height: 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            // openUrl('https://www.twitter.com/');
                          },
                          child: SvgPicture.asset(
                              BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesTwitterDark : 'assets/images/auth_images/mage_x.svg')),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            // openUrl('https://www.tiktok.com/');
                          },
                          child: SvgPicture.asset(
                              BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesTiktokDark : 'assets/images/auth_images/hugeicons_tiktok.svg')),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            // openUrl('https://www.facebook.com/');
                          },
                          child: SvgPicture.asset(
                              'assets/images/auth_images/devicon_facebook.svg'))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
