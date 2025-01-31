// ignore_for_file: unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/presentation/screens/owner_screens/check_car_scrren.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/location_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/profile_screeen.dart';
import 'package:user_app/presentation/screens/owner_screens/settings_screen.dart';
import 'package:user_app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:user_app/presentation/widgets/diagram_charts.dart';

class KnockSensorScreen extends StatefulWidget {
  const KnockSensorScreen({super.key});

  @override
  State<KnockSensorScreen> createState() => _KnockSensorScreenState();
}

class _KnockSensorScreenState extends State<KnockSensorScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CheckCarScrren(),
    const LocationScreen(),
    const ProfileScreeen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: MediaQuery.sizeOf(context).width > 600 ? 45 : null,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, notificationScreen);
              },
              child: SvgPicture.asset(
                  width: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                  height: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                  'assets/images/auth_images/notification_user.svg'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          index: _selectedIndex,
                        )),
                (Route<dynamic> route) => false);
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Knock Sensor',
                  style: AppStyle.styleBold25(context),
                ),
              ),
              Text(
                'Five sides of my car',
                style: AppStyle.styleRegular17(context)
                    .copyWith(color: Color(0xFF9B9090)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Center',
                style: AppStyle.styleRegular20(context)
                    .copyWith(fontFamily: 'Roboto', color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).width > 600 ? 500 : 300,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                      shadows: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                            blurRadius: 4,
                            color: Colors.grey),
                      ],
                      color: MyColors.premiumColor.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: PartDiagramSensorChart(
                      title: "Problem", percent: 0.20, myColor: Colors.red),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).width > 600 ? 600 : 400,
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 20,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top Right',
                                style: AppStyle.styleRegular20(context)
                                    .copyWith(
                                        fontFamily: 'Roboto',
                                        color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  height: MediaQuery.sizeOf(context).width > 600
                                      ? 500
                                      : 300,
                                  width: MediaQuery.sizeOf(context).width >
                                              600 &&
                                          MediaQuery.sizeOf(context).width <
                                              1000
                                      ? 500
                                      : MediaQuery.sizeOf(context).width > 1000
                                          ? MediaQuery.sizeOf(context).width *
                                              0.5
                                          : 300,
                                  decoration: ShapeDecoration(
                                      shadows: [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            color: Colors.grey),
                                      ],
                                      color: MyColors.premiumColor
                                          .withOpacity(0.7),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: PartDiagramSensorChart(
                                      title: "Good",
                                      percent: 1,
                                      myColor: Colors.greenAccent),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top Left',
                                style: AppStyle.styleRegular20(context)
                                    .copyWith(
                                        fontFamily: 'Roboto',
                                        color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  height: MediaQuery.sizeOf(context).width > 600
                                      ? 500
                                      : 300,
                                  width: MediaQuery.sizeOf(context).width >
                                              600 &&
                                          MediaQuery.sizeOf(context).width <
                                              1000
                                      ? 500
                                      : MediaQuery.sizeOf(context).width > 1000
                                          ? MediaQuery.sizeOf(context).width *
                                              0.5
                                          : 300,
                                  decoration: ShapeDecoration(
                                      shadows: [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            color: Colors.grey),
                                      ],
                                      color: MyColors.premiumColor
                                          .withOpacity(0.7),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: PartDiagramSensorChart(
                                      title: "Good",
                                      percent: 1,
                                      myColor: Colors.greenAccent),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).width > 600 ? 600 : 400,
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 20,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bottom Right',
                                style: AppStyle.styleRegular20(context)
                                    .copyWith(
                                        fontFamily: 'Roboto',
                                        color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  height: MediaQuery.sizeOf(context).width > 600
                                      ? 500
                                      : 300,
                                  width: MediaQuery.sizeOf(context).width >
                                              600 &&
                                          MediaQuery.sizeOf(context).width <
                                              1000
                                      ? 500
                                      : MediaQuery.sizeOf(context).width > 1000
                                          ? MediaQuery.sizeOf(context).width *
                                              0.5
                                          : 300,
                                  decoration: ShapeDecoration(
                                      shadows: [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            color: Colors.grey),
                                      ],
                                      color: MyColors.premiumColor
                                          .withOpacity(0.7),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: PartDiagramSensorChart(
                                      title: "Normal",
                                      percent: 0.90,
                                      myColor: Colors.amber),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bottom Left',
                                style: AppStyle.styleRegular20(context)
                                    .copyWith(
                                        fontFamily: 'Roboto',
                                        color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  height: MediaQuery.sizeOf(context).width > 600
                                      ? 500
                                      : 300,
                                  width: MediaQuery.sizeOf(context).width >
                                              600 &&
                                          MediaQuery.sizeOf(context).width <
                                              1000
                                      ? 500
                                      : MediaQuery.sizeOf(context).width > 1000
                                          ? MediaQuery.sizeOf(context).width *
                                              0.5
                                          : 300,
                                  decoration: ShapeDecoration(
                                      shadows: [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            color: Colors.grey),
                                      ],
                                      color: MyColors.premiumColor
                                          .withOpacity(0.7),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: PartDiagramSensorChart(
                                      title: "Normal",
                                      percent: 0.90,
                                      myColor: Colors.amber),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
