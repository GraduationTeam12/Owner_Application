// ignore_for_file: unused_field, deprecated_member_use, library_prefixes, avoid_print

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/logic/board_cubit/board_cubit.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/screens/owner_screens/check_car_scrren.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/location_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/profile_screeen.dart';
import 'package:user_app/presentation/screens/owner_screens/settings_screen.dart';
import 'package:user_app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:user_app/presentation/widgets/temp_sensor_chart.dart';

class TempSensorScreen extends StatefulWidget {
  const TempSensorScreen({super.key});

  @override
  State<TempSensorScreen> createState() => _TempSensorScreenState();
}

class _TempSensorScreenState extends State<TempSensorScreen> {
  // final String notificationsKey = 'cached_notifications';
  Map<String, dynamic>? cachedData;

  @override
  void initState() {
    super.initState();
    final boardCubit = BlocProvider.of<BoardCubit>(context);
    // boardCubit.getBoardData();

    final cachedJson = CacheHelper().getData(key: 'boardData');
    if (cachedJson != null) {
      setState(() {
        cachedData = jsonDecode(cachedJson);
      });
    }
    boardCubit.connectToSocket();
  }

  int _selectedIndex = 0;
  String _translateStatus(String status) {
    switch (status.toLowerCase()) {
      case 'normal':
        return 'طبيعي';
      case 'dangerous':
        return 'خطر';
      case 'medium':
        return 'متوسط';
      default:
        return status;
    }
  }

  final List<Widget> _screens = [
    const CheckCarScrren(),
    const LocationScreen(),
    ProfileScreeen(),
    const SettingsScreen(),
  ];
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  LocaleKeys.TempSensorPage_title.tr(),
                  style: AppStyle.styleBold25(context).copyWith(
                      color: BlocProvider.of<ThemeCubit>(context).isDark
                          ? Colors.white
                          : null),
                ),
              ),
              Text(
                LocaleKeys.TempSensorPage_subtitle.tr(),
                style: AppStyle.styleRegular17(context).copyWith(
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Colors.white
                        : Color(0xFF9B9090)),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width > 600 ? 200 : 30,
              ),
              Container(
                  height: MediaQuery.sizeOf(context).width >= 600 &&
                          MediaQuery.sizeOf(context).width < 1000
                      ? 500
                      : MediaQuery.sizeOf(context).width > 1000
                          ? 600
                          : 400,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: BlocProvider.of<ThemeCubit>(context).isDark
                          ? Color(0xFF263238)
                          : Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 4),
                        )
                      ]),
                  child: Center(
                    child: BlocBuilder<BoardCubit, BoardState>(
                      builder: (context, state) {
                        if (state is BoardLoading && cachedData == null) {
                          return CircularProgressIndicator(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : MyColors.premiumColor,
                          );
                        } else if (state is BoardLoading &&
                            cachedData != null) {
                          final boardData = cachedData!;
                          return CircularGauge(
                            value: boardData['sensors']['fire']
                                ['temperature value'],
                            status: context.locale.languageCode == 'ar'
                                ? _translateStatus(
                                    boardData['sensors']['fire']['statusNow'])
                                : boardData['sensors']['fire']['statusNow'] ??
                                    "N/A",
                          );
                        } else if (state is BoardSuccess) {
                          final boardData = state.res;

                          final newDataString = jsonEncode(boardData);
                          final oldDataString =
                              CacheHelper().getData(key: 'boardData');
                               if (boardData == null || boardData is! Map<String, dynamic>) {
    return Center(child: Text(
    Localizations.localeOf(context).languageCode == 'ar'
        ? "⚠️ بيانات غير صالحة من السيرفر"
        : "⚠️ Invalid data received from the server",
  ),);
  }

                          if (oldDataString == null ||
                              oldDataString != newDataString) {
                            CacheHelper().saveData(
                                key: 'boardData', value: newDataString);
                          }
                          return CircularGauge(
                            value: boardData['sensors']['fire']
                                ['temperature value'],
                              status: context.locale.languageCode == 'ar'
                                ? _translateStatus(
                                    boardData['sensors']['fire']['statusNow'])
                                : boardData['sensors']['fire']['statusNow'] ??
                                    "N/A",
                          );
                        } else if (state is BoardError) {
                          return Text("❌ error : ${state.message}");
                        }
                        return SizedBox();
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
