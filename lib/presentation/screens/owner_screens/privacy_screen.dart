// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ?   Color(0xFF263238):MyColors.premiumColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                                    ?   Color(0xFF263238): MyColors.premiumColor,
        toolbarHeight: MediaQuery.sizeOf(context).height / 9.8,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: MediaQuery.sizeOf(context).width > 600 ? 45 : null,
          ),
        ),
        title: Text(
          context.locale.languageCode == 'ar'
              ? 'سياسة الخصوصية'
              : 'Privacy Policy',
          style: AppStyle.styleBold30(context).copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                                    ?   Colors.black: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locale.languageCode == 'ar'
                        ? 'سياسة الخصوصية للتطبيقات'
                        : 'Privacy Policy for SATARS',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    context.locale.languageCode == 'ar'
                        ? 'نحن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية. يهدف تطبيقنا إلى توفير خدمات تعتمد على الموقع لإبلاغك بأقرب المستشفيات في حالات الطوارئ. توضح هذه السياسة كيفية جمع معلوماتك الشخصية واستخدامها وحمايتها عند استخدام تطبيقنا.'
                        : 'we value your privacy and are committed to protecting your personal data. Our app aims to provide location-based services to notify you of the nearest hospitals in case of emergencies. This policy explains how we collect, use, and protect your personal information when using our app',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'جمع المعلومات' : 'Information Collection',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'نحن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية.' : 'We collect certain types of personal data when you use our app, including:',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'موقعك: نحن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية' : 'Your location: We collect your geographical location to accurately identify the nearest hospitals in emergency situations',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'معلومات التجهيز: نحن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية' : 'Device information: We may collect technical information related to your device, such as device type, operating system, and other essential details to enhance your experience.',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'استخدام المعلومات' : 'Use of Information',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'نحن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية' : 'We use the collected information for the following purposes:To determine your current location and notify you of the nearest hospitals.To improve the user experience and ensure a quick response in emergencies.To provide additional location-based services, such as directions to the hospital',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'مشاركة المعلومات' : 'Sharing of Information',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'نحن لا نبيع او ناجرنت بياناتك الشخصية للطرفين الثالثين' : 'We do not sell or rent your personal information to third parties. We may share certain information with:- **Hospitals**: When there is a need to notify the nearest hospital for emergency purposes.- **Trusted partners**: Who assist us in operating the app and improving services, with strict agreements to protect your privacy.',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'حماية المعلومات' : 'Protection of Information',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'نحن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية' : 'We are committed to taking all appropriate security measures to protect your personal data from unauthorized access, modification, or disclosure. These measures include:- Encryption.- Using secure protocols (such as HTTPS).- Limited access to information by authorized personnel only.',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'حقوق المستخدم' : 'User Rights',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'نحن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية' : 'You have control over your personal information through:Disabling location services: You can disable location tracking at any time in your device’s settings.Requesting data deletion: You can request that your personal data be permanently deleted from our systems.Reviewing data: You have the right to request a review of the information we have collected about you.',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'تغييرات في سياسة الخصوصية' : 'Changes to the Privacy Policy',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'نحن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية' : 'We reserve the right to modify this privacy policy from time to time. In the event of significant changes, we will notify you through the app or via email',
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: Color(0xFFA8A1A1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'اتصل بنا' : 'Contact Us',
                    style: AppStyle.styleBold20(context)
                        .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                                    ? Colors.white: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.locale.languageCode == 'ar' ? 'اذا كنت تحتاج لمساعدة او ترغب في التواصل معنا' : 'If you have any questions or concerns regarding this privacy policy, please feel free to contact us at [Company email] or by phone atSocial media Accounts',
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
