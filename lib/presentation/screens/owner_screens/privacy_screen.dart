// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:user_app/constants/app_constants.dart';
import 'package:user_app/constants/app_style.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height / 8,
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
        title: Text(
           AppConstants.lang == 'ar' ? 'سياسة الخصوصية' : 'Privacy Policy',
          style: AppStyle.styleBold30(context).copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: AppConstants.lang == 'ar' ? CrossAxisAlignment.end :CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy Policy for SATARS',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'we value your privacy and are committed to protecting your personal data. Our app aims to provide location-based services to notify you of the nearest hospitals in case of emergencies. This policy explains how we collect, use, and protect your personal information when using our app',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Information Collection',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We collect certain types of personal data when you use our app, including:',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Your location: We collect your geographical location to accurately identify the nearest hospitals in emergency situations',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Device information: We may collect technical information related to your device, such as device type, operating system, and other essential details to enhance your experience.',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Use of Information',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We use the collected information for the following purposes:To determine your current location and notify you of the nearest hospitals.To improve the user experience and ensure a quick response in emergencies.To provide additional location-based services, such as directions to the hospital',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sharing of Information',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We do not sell or rent your personal information to third parties. We may share certain information with:- **Hospitals**: When there is a need to notify the nearest hospital for emergency purposes.- **Trusted partners**: Who assist us in operating the app and improving services, with strict agreements to protect your privacy.',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    'Protection of Information',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We are committed to taking all appropriate security measures to protect your personal data from unauthorized access, modification, or disclosure. These measures include:- Encryption.- Using secure protocols (such as HTTPS).- Limited access to information by authorized personnel only.',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    'User Rights',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'You have control over your personal information through:Disabling location services: You can disable location tracking at any time in your device’s settings.Requesting data deletion: You can request that your personal data be permanently deleted from our systems.Reviewing data: You have the right to request a review of the information we have collected about you.',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    'Changes to the Privacy Policy',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We reserve the right to modify this privacy policy from time to time. In the event of significant changes, we will notify you through the app or via email',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    'Contact Us',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'If you have any questions or concerns regarding this privacy policy, please feel free to contact us at [Company email] or by phone atSocial media Accounts',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
