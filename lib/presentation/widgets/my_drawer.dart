import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/constants/app_constants.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/models/drawer_model.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';
import 'package:user_app/presentation/widgets/dialog_logout.dart';

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
          img: 'assets/images/auth_images/myprofile.svg',
          onTap: () {}),
      DrawerModel(
          title: LocaleKeys.Drawer_car.tr(),
          img: 'assets/images/auth_images/mycar.svg',
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
          img: 'assets/images/auth_images/location.svg',
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
          img: 'assets/images/auth_images/contact.svg',
          onTap: () {
            Navigator.pushNamed(context, contactScreen);
          }),
      DrawerModel(
        title: LocaleKeys.Drawer_privacyPolicy.tr(),
        img: 'assets/images/auth_images/privacy.svg',
        onTap: () {
          Navigator.pushNamed(context, privacyScreen);
        },
      ),
      DrawerModel(
          title: LocaleKeys.Drawer_shareApp.tr(),
          img: 'assets/images/auth_images/shareapp.svg',
          onTap: () {}),
      DrawerModel(
          title: LocaleKeys.Drawer_rate.tr(),
          img: 'assets/images/auth_images/star.svg',
          onTap: () {
            Navigator.pushNamed(context, rateScreen);
          }),
      DrawerModel(
          title: LocaleKeys.Drawer_settings.tr(),
          img: 'assets/images/auth_images/settings.svg',
          onTap: () {}),
    ];

    return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width > 600
            ? MediaQuery.of(context).size.width * .55
            : MediaQuery.of(context).size.width * .7,
        // color: MyColors.premiumColor,
        decoration: ShapeDecoration(
            color: MyColors.premiumColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ))),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipOval(
                child: Image.asset('assets/images/auth_images/drawerphoto.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ayman Ahmed',
                style: AppStyle.styleRegular20(context)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Ayman.Ahmed@gmail.com',
                style: AppStyle.styleRegular20(context)
                    .copyWith(color: Colors.white),
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
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  items[index].title,
                                  style: AppStyle.styleRegular20(context)
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              Transform.rotate(
                                angle: -1.5708 * 2,
                                child: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Colors.white,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 50
                                      : 20,
                                ),
                              ),
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
                          buildDrawerListItemsDivider(),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width > 600 ? 70 : null,
                width: AppConstants.lang == 'ar' &&
                        MediaQuery.sizeOf(context).width > 600
                    ? 300
                    : AppConstants.lang == 'ar' &&
                            MediaQuery.sizeOf(context).width < 600
                        ? 190
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: AppConstants.lang == 'ar'
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: const Color(0xFFA8A1A1),
                        size: MediaQuery.sizeOf(context).width > 600 ? 50 : 24,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            LocaleKeys.Drawer_logout.tr(),
                            style: AppStyle.styleBold20(context).copyWith(
                              color: const Color(0xFFA8A1A1),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        )));
  }
}
