// ignore_for_file: unused_field, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/screens/owner_screens/check_car_scrren.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/location_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/profile_screeen.dart';
import 'package:user_app/presentation/screens/owner_screens/settings_screen.dart';
import 'package:user_app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:user_app/presentation/widgets/sensor_chart.dart';

class WaterSensorScreen extends StatefulWidget {
  const WaterSensorScreen({super.key});

  @override
  State<WaterSensorScreen> createState() => _WaterSensorScreenState();
}

class _WaterSensorScreenState extends State<WaterSensorScreen> {

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
            padding: context.locale.languageCode == 'ar'
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.only(right: 20),
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

      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  LocaleKeys.WaterSensorPage_title.tr(),
                  style: AppStyle.styleBold25(context),
                ),
              ),
              Text(
                LocaleKeys.WaterSensorPage_subtitle.tr(),
                style: AppStyle.styleRegular17(context)
                    .copyWith(color: Color(0xFF9B9090)),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width > 600 ? 200 : 30,
              ),

              Container(
                height: MediaQuery.sizeOf(context).width > 1000 ? 500 : 400,
                decoration: ShapeDecoration(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  )
                ]
                ),
                child: SensorChart(percent: '15.66%', title: LocaleKeys.SensorsState_problem.tr(),))
          ],
        ),
      ),
      ),
    );
  }
}