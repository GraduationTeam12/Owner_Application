import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/models/drawer_model.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget buildDrawerListItemsDivider() {
    return const Divider(
      height: 0,
      color: Colors.white,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<DrawerModel> items = [
      DrawerModel(
          title: LocaleKeys.Drawer_profile.tr(),
          img: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesProfileDark : Assets.imagesAuthImagesPersonDrawerBlack,
          onTap: () {
            Navigator.pushNamed(context, editProfileScreen);
          }),
      DrawerModel(
          title: LocaleKeys.Drawer_car.tr(),
          img: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesGroup441 : Assets.imagesAuthImagesCarDrawerBlack,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          index: 0,
                        )));
          }),
      DrawerModel(
          title: LocaleKeys.Drawer_location.tr(),
          img: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesLocationDark : Assets.imagesAuthImagesLocationDrawerBlack,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          index: 1,
                        )));
          }),
      DrawerModel(
          title: LocaleKeys.Drawer_contact.tr(),
          img: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesContactDark : Assets.imagesAuthImagesContactDrawerBlack,
          onTap: () {
            Navigator.pushNamed(context, contactScreen);
          }),
      DrawerModel(
        title: LocaleKeys.Drawer_privacyPolicy.tr(),
        img: BlocProvider.of<ThemeCubit>(context).isDark
                      ?  Assets.imagesAuthImagesPrivacyDark : Assets.imagesAuthImagesPrivacyDrawerBlack,
        onTap: () {
          Navigator.pushNamed(context, privacyScreen);
        },
      ),
      DrawerModel(
          title: LocaleKeys.Drawer_shareApp.tr(),
          img: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesShareDark : Assets.imagesAuthImagesShareDrawerBlack,
          onTap: () {}),
      DrawerModel(
          title: LocaleKeys.Drawer_rate.tr(),
          img: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesStarDark : Assets.imagesAuthImagesRateDrawerBlack,
          onTap: () {
            Navigator.pushNamed(context, rateScreen);
          }),
      DrawerModel(
          title: LocaleKeys.Drawer_settings.tr(),
          img: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesSettingDark : Assets.imagesAuthImagesSettingsDrawerBlack,
          onTap: () {}),
    ];

    return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width > 600
            ? MediaQuery.of(context).size.width * .6
            : MediaQuery.of(context).size.width * .8,
        // color: MyColors.premiumColor,
        decoration: ShapeDecoration(
            color: BlocProvider.of<ThemeCubit>(context).isDark
                ? Color(0xFF263238)
                : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ))),
        child: SafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                        width: MediaQuery.sizeOf(context).width > 600 ? 75 : 60,
                        height:
                            MediaQuery.sizeOf(context).width > 600 ? 75 : 60,
                        'assets/images/auth_images/drawerphoto.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ayman Ahmed',
                          style: AppStyle.styleRegular20(context).copyWith(
                              color: BlocProvider.of<ThemeCubit>(context).isDark
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'ayman.ahmed@gmail.com',
                          style: AppStyle.styleRegular20(context).copyWith(
                              color: BlocProvider.of<ThemeCubit>(context).isDark
                                  ? Colors.white54
                                  : Colors.black.withOpacity(0.5)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: null,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).width > 600 ? 60 : 30,
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.grey
                      : Colors.black,
                  thickness: 0.8,
                )),
              ],
            ),

            SizedBox(
              height: MediaQuery.sizeOf(context).width > 600 ? 60 : 30,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: items[index].onTap,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset(
                                items[index].img,
                                width: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 24,
                                height: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 24,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                items[index].title,
                                style: AppStyle.styleRegular22(context)
                                    .copyWith(
                                        color:
                                            BlocProvider.of<ThemeCubit>(context)
                                                    .isDark
                                                ? Colors.white
                                                : Colors.black,
                                        fontFamily: 'Roboto'),
                              ),
                            ),
                            // Transform.rotate(
                            //   angle: -1.5708 * 2,
                            //   child: Icon(
                            //     Icons.arrow_back_ios_new_outlined,
                            //     color: Colors.white,
                            //     size: MediaQuery.sizeOf(context).width > 600
                            //         ? 40
                            //         : 20,
                            //   ),
                            // ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width > 600
                                  ? 20
                                  : 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).width > 600
                              ? MediaQuery.sizeOf(context).height * 0.02
                              : 11,
                        ),
                        // buildDrawerListItemsDivider(),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                );
              },
            ),
            // SizedBox(
            //   height: 30,
            // ),
          ]),
        )));
  }
}