import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/add_member_form.dart';
import 'package:user_app/presentation/widgets/local_notifications.dart';

class AddMembersScreen extends StatefulWidget {
  const AddMembersScreen({super.key});

  @override
  State<AddMembersScreen> createState() => AddMembersScreenState();
}

class AddMembersScreenState extends State<AddMembersScreen> {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    // await messaging.getToken().then((value) {
    //   // Save the token if needed
    // });
    messaging.onTokenRefresh.listen((value) {
      // Handle token refresh
    });
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);

    // Handle foreground messages
    handleForegroundMessage();
    messaging.subscribeToTopic('all').then((val) {
      log('Subscribed to topic');
    });
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        LocalNotificationService.showBasicNotification(message);
      },
    );
  }

  @override
  void initState() {
    CacheHelper().saveData(key: 'AddMemberScreen', value: 'Visited');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.premiumColor,
        
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locale.languageCode == 'ar' ?  "مرحباً بك, أحمد" : 'Welcome ,Ahmed',
                    style: AppStyle.styleSemiBold22(context)
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                   LocaleKeys.Authentication_title.tr(),
                    style: AppStyle.styleRegular20(context)
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).width > 600 ? 40 : 10,
            ),
            Expanded(
              child: AddMemberForm(),
            )
          ],
        ),
      ),
    );
  }
}

