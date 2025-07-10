// ignore_for_file: unused_field, deprecated_member_use

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/logic/board_cubit/board_cubit.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/presentation/screens/owner_screens/check_car_scrren.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/location_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/profile_screeen.dart';
import 'package:user_app/presentation/screens/owner_screens/settings_screen.dart';
import 'package:user_app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:user_app/presentation/widgets/knock_sensor_data.dart';

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
    ProfileScreeen(),
    const SettingsScreen(),
  ];

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
        // actions: [
        //   Padding(
        //     padding: context.locale.languageCode == 'ar'
        //         ? const EdgeInsets.symmetric(horizontal: 20)
        //         : const EdgeInsets.only(right: 20),
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.pushNamed(context, notificationScreen);
        //       },
        //       child: SvgPicture.asset(
        //           width: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
        //           height: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
        //           BlocProvider.of<ThemeCubit>(context).isDark
        //               ? Assets.imagesAuthImagesNotificationDark
        //               : 'assets/images/auth_images/notification_user.svg'),
        //     ),
        //   ),
        // ],
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
          if (state is BoardLoading && cachedData == null) {
            return Center(
                child: CircularProgressIndicator(
              color: MyColors.premiumColor,
            ));
          } else if (state is BoardLoading && cachedData != null) {
            final boardData = cachedData!;
            return KnockSensorData(boardData: boardData);
          } else if (state is BoardSuccess) {
            final boardData = state.res;

            final newDataString = jsonEncode(boardData);
            final oldDataString = CacheHelper().getData(key: 'boardData');
             if (boardData == null || boardData is! Map<String, dynamic>) {
    return Center(child: Text(
    Localizations.localeOf(context).languageCode == 'ar'
        ? "⚠️ بيانات غير صالحة من السيرفر"
        : "⚠️ Invalid data received from the server",
  ),);
  }

            // لو مفيش كاش أو الكاش مختلف، نحدّثه
            if (oldDataString == null || oldDataString != newDataString) {
              CacheHelper().saveData(key: 'boardData', value: newDataString);
            }
            return KnockSensorData(boardData: boardData);
          } else if (state is BoardError) {
            return Text("❌ error : ${state.message}");
          }
          return SizedBox();
        },
      ),
    );
  }
}
