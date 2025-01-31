// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
        leadingWidth: MediaQuery.sizeOf(context).width > 600 ? 80 : null,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
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
        title: Row(
          children: [
            Spacer(),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                  width: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                  height: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                  'assets/images/auth_images/notification_user.svg'),
            ),
          ],
        ),
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
    );
  }
}
