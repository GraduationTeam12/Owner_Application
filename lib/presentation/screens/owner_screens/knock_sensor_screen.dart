// ignore_for_file: unused_field, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/logic/board_cubit/board_cubit.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
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
  void initState() {
    super.initState();
    final boardCubit = BlocProvider.of<BoardCubit>(context);
    boardCubit.getBoardData(); 
    boardCubit.connectToSocket(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
          ? Color(0xFF1E1E1E)
          : Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
            ? Color(0xFF263238)
            : Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: BlocProvider.of<ThemeCubit>(context).isDark
                ? Colors.white
                : Colors.black,
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
                  BlocProvider.of<ThemeCubit>(context).isDark
                      ? Assets.imagesAuthImagesNotificationDark
                      : 'assets/images/auth_images/notification_user.svg'),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: CustomBottomNavigationBar(
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
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   selectedIndex: _selectedIndex,
      //   onItemSelected: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //       Navigator.pushAndRemoveUntil(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => HomeScreen(
      //                     index: _selectedIndex,
      //                   )),
      //           (Route<dynamic> route) => false);
      //     });
      //   },
      // ),
      body: BlocBuilder<BoardCubit, BoardState>(
        builder: (context, state) {
          if (state is BoardLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BoardSuccess) {
            final boardData = state.res;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                      child: Text(
                        LocaleKeys.knockSensorPage_title.tr(),
                        style: AppStyle.styleBold25(context).copyWith(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : null),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        LocaleKeys.knockSensorPage_subtitle.tr(),
                        style: AppStyle.styleRegular17(context).copyWith(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : Color(0xFF9B9090)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        LocaleKeys.knockSensorPage_center.tr(),
                        style: AppStyle.styleRegular20(context).copyWith(
                            fontFamily: 'Roboto',
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height:
                            MediaQuery.sizeOf(context).width > 600 ? 500 : 300,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                            shadows: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  color: Colors.grey),
                            ],
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Color(0xFF1E1E1E)
                                : Color(0xFFE0E0E0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: PartDiagramSensorChart(
                            title: LocaleKeys.SensorsState_problem.tr(),
                            percent: 0.20,
                            myColor: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height:
                            MediaQuery.sizeOf(context).width > 600 ? 600 : 400,
                        child: Row(
                          children: [
                            Wrap(
                              spacing: 20,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 0)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.knockSensorPage_topRight.tr(),
                                      style: AppStyle.styleRegular20(context)
                                          .copyWith(
                                              fontFamily: 'Roboto',
                                              color:
                                                  BlocProvider.of<ThemeCubit>(
                                                              context)
                                                          .isDark
                                                      ? Colors.white
                                                      : Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).width >
                                                    600
                                                ? 500
                                                : 300,
                                        width: MediaQuery.sizeOf(context)
                                                        .width >
                                                    600 &&
                                                MediaQuery.sizeOf(context)
                                                        .width <
                                                    1000
                                            ? 500
                                            : MediaQuery.sizeOf(context).width >
                                                    1000
                                                ? MediaQuery.sizeOf(context)
                                                        .width *
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
                                            color: BlocProvider.of<ThemeCubit>(
                                                        context)
                                                    .isDark
                                                ? Color(0xFF1E1E1E)
                                                : Color(0xFFE0E0E0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        child: PartDiagramSensorChart(
                                            title: LocaleKeys.SensorsState_good
                                                .tr(),
                                            percent: boardData['sensors']['Force']['value1']*.01,
                                            myColor: Color(0xFF7793B7)),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.knockSensorPage_topLeft.tr(),
                                      style: AppStyle.styleRegular20(context)
                                          .copyWith(
                                              fontFamily: 'Roboto',
                                              color:
                                                  BlocProvider.of<ThemeCubit>(
                                                              context)
                                                          .isDark
                                                      ? Colors.white
                                                      : Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).width >
                                                    600
                                                ? 500
                                                : 300,
                                        width: MediaQuery.sizeOf(context)
                                                        .width >
                                                    600 &&
                                                MediaQuery.sizeOf(context)
                                                        .width <
                                                    1000
                                            ? 500
                                            : MediaQuery.sizeOf(context).width >
                                                    1000
                                                ? MediaQuery.sizeOf(context)
                                                        .width *
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
                                            color: BlocProvider.of<ThemeCubit>(
                                                        context)
                                                    .isDark
                                                ? Color(0xFF1E1E1E)
                                                : Color(0xFFE0E0E0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        child: PartDiagramSensorChart(
                                            title: LocaleKeys.SensorsState_good
                                                .tr(),
                                            percent: boardData['sensors']['Force']['value1']*.01,
                                            myColor: Color(0xFF7793B7)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(left: 0)),
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
                        height:
                            MediaQuery.sizeOf(context).width > 600 ? 600 : 400,
                        child: Row(
                          children: [
                            Wrap(
                              spacing: 20,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 0)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.knockSensorPage_bottomRight
                                          .tr(),
                                      style: AppStyle.styleRegular20(context)
                                          .copyWith(
                                              fontFamily: 'Roboto',
                                              color:
                                                  BlocProvider.of<ThemeCubit>(
                                                              context)
                                                          .isDark
                                                      ? Colors.white
                                                      : Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).width >
                                                    600
                                                ? 500
                                                : 300,
                                        width: MediaQuery.sizeOf(context)
                                                        .width >
                                                    600 &&
                                                MediaQuery.sizeOf(context)
                                                        .width <
                                                    1000
                                            ? 500
                                            : MediaQuery.sizeOf(context).width >
                                                    1000
                                                ? MediaQuery.sizeOf(context)
                                                        .width *
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
                                            color: BlocProvider.of<ThemeCubit>(
                                                        context)
                                                    .isDark
                                                ? Color(0xFF1E1E1E)
                                                : Color(0xFFE0E0E0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        child: PartDiagramSensorChart(
                                            title: LocaleKeys
                                                .SensorsState_normal.tr(),
                                            percent: boardData['sensors']['Force']['value1']*.01,
                                            myColor: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.knockSensorPage_bottomLeft
                                          .tr(),
                                      style: AppStyle.styleRegular20(context)
                                          .copyWith(
                                              fontFamily: 'Roboto',
                                              color:
                                                  BlocProvider.of<ThemeCubit>(
                                                              context)
                                                          .isDark
                                                      ? Colors.white
                                                      : Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).width >
                                                    600
                                                ? 500
                                                : 300,
                                        width: MediaQuery.sizeOf(context)
                                                        .width >
                                                    600 &&
                                                MediaQuery.sizeOf(context)
                                                        .width <
                                                    1000
                                            ? 500
                                            : MediaQuery.sizeOf(context).width >
                                                    1000
                                                ? MediaQuery.sizeOf(context)
                                                        .width *
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
                                            color: BlocProvider.of<ThemeCubit>(
                                                        context)
                                                    .isDark
                                                ? Color(0xFF1E1E1E)
                                                : Color(0xFFE0E0E0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        child: PartDiagramSensorChart(
                                            title: LocaleKeys
                                                .SensorsState_normal.tr(),
                                            percent: boardData['sensors']['Force']['value1']*.01,
                                            myColor: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(left: 0)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            MediaQuery.sizeOf(context).width > 600 ? 135 : 75),
                  ],
                ),
              ),
            );
          } else if (state is BoardError) {
            return Text("❌ error : ${state.message}");
          }
          return SizedBox();
        },
      ),
    );
  }
}
