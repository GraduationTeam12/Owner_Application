// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/screens/owner_screens/check_car_scrren.dart';
import 'package:user_app/presentation/screens/owner_screens/location_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/profile_screeen.dart';
import 'package:user_app/presentation/screens/owner_screens/settings_screen.dart';
import 'package:user_app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:user_app/presentation/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.index});

  int? index;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CheckCarScrren(),
    const LocationScreen(),
    const ProfileScreeen(),
    const SettingsScreen(),
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    widget.index = _selectedIndex;
    return WillPopScope(
      onWillPop: () async {
        if (widget.index != 0 || _selectedIndex != 0) {
          setState(() {
            widget.index = 0;
            _selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        drawer: _selectedIndex == 1 || widget.index == 1 ? null : MyDrawer(),
        appBar: _selectedIndex == 1 ||
                widget.index == 1 ||
                _selectedIndex == 2 ||
                widget.index == 2
            ? null
            : _selectedIndex == 3 || widget.index == 3
                ? AppBar(
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
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      index: 0,
                                    )),
                            (routes) => false);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size:
                            MediaQuery.sizeOf(context).width > 600 ? 45 : null,
                      ),
                    ),
                    title: Text(
                      LocaleKeys.Drawer_settings.tr(),
                      style: AppStyle.styleBold30(context)
                          .copyWith(color: Colors.white),
                    ),
                    centerTitle: true,
                  )
                : AppBar(
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Color(0xFF263238)
                        : Colors.white,
                    toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
                    leadingWidth:
                        MediaQuery.sizeOf(context).width > 600 ? 80 : null,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: BlocProvider.of<ThemeCubit>(context).isDark
                            ? Image.asset(
                                fit: MediaQuery.sizeOf(context).width > 600
                                    ? BoxFit.contain
                                    : null,
                                Assets.imagesAuthImagesDrawerDark)
                            : Image.asset(
                                fit: MediaQuery.sizeOf(context).width > 600
                                    ? BoxFit.contain
                                    : null,
                                'assets/images/auth_images/drawerpng.png'),
                      ),
                    ),
                    title: _selectedIndex == 0 || widget.index == 0
                        ? Text(
                            LocaleKeys.carPage_appbar.tr(),
                            style: AppStyle.styleBold30(context).copyWith(
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? Colors.white
                                        : null),
                          )
                        : Row(
                            children: [
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    width:
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 60
                                            : null,
                                    height:
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 60
                                            : null,
                                    'assets/images/auth_images/notification_user.svg'),
                              ),
                            ],
                          ),
                    actions: _selectedIndex == 0 || widget.index == 0
                        ? [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, notificationScreen);
                                },
                                child: BlocProvider.of<ThemeCubit>(context)
                                        .isDark
                                    ? SvgPicture.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width >
                                                    600
                                                ? 60
                                                : null,
                                        height:
                                            MediaQuery.sizeOf(context).width >
                                                    600
                                                ? 60
                                                : null,
                                        Assets.imagesAuthImagesNotificationDark)
                                    : SvgPicture.asset(
                                        width:
                                            MediaQuery.sizeOf(context).width >
                                                    600
                                                ? 60
                                                : null,
                                        height:
                                            MediaQuery.sizeOf(context).width >
                                                    600
                                                ? 60
                                                : null,
                                        'assets/images/auth_images/notification_user.svg'),
                              ),
                            ),
                          ]
                        : null,
                    centerTitle:
                        _selectedIndex == 0 || widget.index == 0 ? true : false,
                  ),

        body: _screens[widget.index ?? _selectedIndex],
        floatingActionButtonLocation: _selectedIndex == 2 || widget.index == 2
            ? null
            : FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _selectedIndex == 2 || widget.index == 2
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomBottomNavigationBar(
                  selectedIndex: widget.index ?? _selectedIndex,
                  onItemSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                      widget.index = index;
                    });
                  },
                ),
              ),
        backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
            ? Color(0xFF1E1E1E)
            : Colors.white,
        // bottomNavigationBar: CustomBottomNavigationBar(
        //   selectedIndex: widget.index ?? _selectedIndex,
        //   onItemSelected: (index) {
        //     setState(() {
        //       widget.index = index;
        //     });
        //   },
        // ),
      ),
    );
  }
}
