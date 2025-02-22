// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/pages_name.dart';
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
  final int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CheckCarScrren(),
    const LocationScreen(),
    const ProfileScreeen(),
    const SettingsScreen(),
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.index != 0) {
          setState(() {
            widget.index = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: _selectedIndex == 1 || widget.index == 1 ? null : MyDrawer(),
        appBar: _selectedIndex == 1 || widget.index == 1
            ? null
            : AppBar(
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.white,
                toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
                leadingWidth:
                    MediaQuery.sizeOf(context).width > 600 ? 80 : null,
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: Image.asset(
                        fit: MediaQuery.sizeOf(context).width > 600
                            ? BoxFit.contain
                            : null,
                        'assets/images/auth_images/drawerpng.png'),
                  ),
                ),
                title: _selectedIndex == 0 || widget.index == 0
                    ? Text(
                        LocaleKeys.carPage_appbar.tr(),
                        style: AppStyle.styleBold30(context),
                      )
                    : Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                                width: MediaQuery.sizeOf(context).width > 600
                                    ? 60
                                    : null,
                                height: MediaQuery.sizeOf(context).width > 600
                                    ? 60
                                    : null,
                                'assets/images/auth_images/notification_user.svg'),
                          ),
                        ],
                      ),
                actions: _selectedIndex == 0 || widget.index == 0
                    ? [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, notificationScreen);
                            },
                            child: SvgPicture.asset(
                                width: MediaQuery.sizeOf(context).width > 600
                                    ? 60
                                    : null,
                                height: MediaQuery.sizeOf(context).width > 600
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
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: widget.index ?? _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              widget.index = index;
            });
          },
        ),
      ),
    );
  }
}
