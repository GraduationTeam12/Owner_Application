// ignore_for_file: library_prefixes, avoid_print

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:user_app/constants/app_style.dart';

class SensorsScreen extends StatefulWidget {
  const SensorsScreen({super.key});

  @override
  State<SensorsScreen> createState() => _SensorsScreenState();
}

class _SensorsScreenState extends State<SensorsScreen> {
  late IO.Socket socket;
  Map<String, dynamic> sensorData = {}; // لتخزين بيانات المستشعرات
  Map<String, dynamic> locationData = {}; // لتخزين بيانات الموقع
  String status = ''; // حالة الجهاز
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3OWJhNWRhNDY3NTM2MDdlMDQ4MTIwMyIsImlhdCI6MTczOTI4NTU0NiwiZXhwIjoxODMzOTU4MzQ2fQ.7xUjLrup8mkwlebsUm_NwVbyZXAnMmU7iJCHxZfTQSk';

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
      'https://satars.onrender.com/',
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
        locationData = data['Location'] ?? {};
        sensorData = data['sensors'] ?? {};
        status = data['status'] ?? 'Unknown';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                '${locationData["Latitude"]}',
                style: AppStyle.styleSemiBold22(context)
                    .copyWith(color: Colors.black),
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                '',
                style: AppStyle.styleSemiBold22(context)
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ));
  }
}
