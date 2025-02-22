// ignore_for_file: unused_field, deprecated_member_use, library_prefixes, avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/api/end_points.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/screens/owner_screens/check_car_scrren.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/location_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/profile_screeen.dart';
import 'package:user_app/presentation/screens/owner_screens/settings_screen.dart';
import 'package:user_app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:user_app/presentation/widgets/temp_sensor_chart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TempSensorScreen extends StatefulWidget {
  const TempSensorScreen({super.key});

  @override
  State<TempSensorScreen> createState() => _TempSensorScreenState();
}

class _TempSensorScreenState extends State<TempSensorScreen> {
  late IO.Socket socket;
  Map<String, dynamic> sensorData = {};
  Map<String, dynamic> locationData = {};
  String status = '';
  String token = CacheHelper().getData(key: ApiKeys.token);
  dynamic tempValue = 0;
  String tempLevel = '';

  // CacheHelper().getData(key: ApiKeys.token);
  final String notificationsKey = 'cached_notifications';

  @override
  void initState() {
    super.initState();

    // _loadCachedNotifications();
    _connectToSocket();
  }

  // Future<void> _loadCachedNotifications() async {
  //   var cachedData = CacheHelper().getData(key: notificationsKey);
  //   if (cachedData != null) {
  //     setState(() {
  //       notifications = jsonDecode(cachedData);
  //     });
  //   }
  // }

  // Future<void> _saveNotificationsToCache(List<dynamic> data) async {
  //   await CacheHelper().saveData(
  //     key: notificationsKey,
  //     value: jsonEncode(data),
  //   );
  // }

  void _connectToSocket() {
    socket = IO.io(
      'https://satars.onrender.com/user-sensors',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setExtraHeaders({'Authorization': 'Bearer $token'})
          .disableAutoConnect()
          .build(),
    );

    socket.onConnect((_) {
      print('Connected to server');
      print(token);
    });

    socket.on('board-data-updated', (data) async {
      print('Data received: $data');

      setState(() {
        locationData = data['Location'];
        sensorData = data['sensors'];
        tempValue = sensorData['fire']['temperature value'];
        tempLevel = sensorData['fire']['classification level'];
        status = data['status'];
      });
      // if (!_areNotificationsEqual(notifications, boardData)) {
      //   setState(() {
      //     notifications = boardData;
      //   });

      //   // await _saveNotificationsToCache(notifications);
      // }
    });

    socket.onDisconnect((_) {
      print('Disconnected from server');
    });

    socket.connect();
  }

  // bool _areNotificationsEqual(
  //     List<dynamic> old, List<dynamic> newNotifications) {
  //   if (old.length != newNotifications.length) return false;
  //   for (int i = 0; i < old.length; i++) {
  //     if (old[i]['id'] != newNotifications[i]['id']) return false;
  //   }
  //   return true;
  // }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

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
                  style: AppStyle.styleBold25(context),
                ),
              ),
              Text(
                LocaleKeys.TempSensorPage_subtitle.tr(),
                style: AppStyle.styleRegular17(context)
                    .copyWith(color: Color(0xFF9B9090)),
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
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 4),
                        )
                      ]),
                  child: Center(
                      child: tempLevel == ''
                          ? CircularProgressIndicator(
                              color: MyColors.premiumColor,
                            )
                          : CircularGauge(
                              value: tempValue,
                              status: tempLevel,
                            )))
            ],
          ),
        ),
      ),
    );
  }
}
