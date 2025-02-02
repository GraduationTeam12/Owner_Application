// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/generated/locale_keys.g.dart';

class CheckCarScrren extends StatelessWidget {
  const CheckCarScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Text(
            //     'Car effectiveness',
            //     style: AppStyle.styleBold30(context),
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.sizeOf(context).width > 600 &&
                      MediaQuery.sizeOf(context).width < 1050
                  ? 10
                  : MediaQuery.sizeOf(context).width > 1050
                      ? MediaQuery.sizeOf(context).width * 0.15
                      : 70,
            ),
            Center(
                child: Image.asset(
                    fit: BoxFit.fill,
                    width: MediaQuery.sizeOf(context).width > 600
                        ? MediaQuery.sizeOf(context).width * 0.8
                        : null,
                    height: MediaQuery.sizeOf(context).width > 600
                        ? MediaQuery.sizeOf(context).height * 0.5
                        : null,
                    'assets/images/auth_images/caaaaar.png')),
            SizedBox(
              height: MediaQuery.sizeOf(context).width > 600 ? 10 : 60,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).width > 600
                    ? 250
                    : MediaQuery.sizeOf(context).width > 500 &&
                            MediaQuery.sizeOf(context).width < 600
                        ? 160
                        : 150,
                child: Row(
                  children: [
                    Wrap(
                      spacing: MediaQuery.sizeOf(context).width > 600 ? 30 : 20,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, knockSensorScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: MediaQuery.sizeOf(context).width < 500
                                ? 140
                                : MediaQuery.sizeOf(context).width > 500 &&
                                        MediaQuery.sizeOf(context).width < 600
                                    ? 150
                                    : null,
                            decoration: ShapeDecoration(
                                shadows: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ],
                                color: Color(0xFF8C9EB7),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 20
                                            : 10))),
                            child: Column(
                              children: [
                                FittedBox(
                                  child: Text(
                                    LocaleKeys.carPage_knockSensor.tr(),
                                    style: AppStyle.styleRegular25(context)
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                    fit: BoxFit.contain,
                                    width:
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 100
                                            : null,
                                    height:
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 100
                                            : null,
                                    'assets/images/auth_images/Ppoximitysensor.png')
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, waterSensorScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: MediaQuery.sizeOf(context).width < 500
                                ? 140
                                : MediaQuery.sizeOf(context).width > 500 &&
                                        MediaQuery.sizeOf(context).width < 600
                                    ? 150
                                    : null,
                            decoration: ShapeDecoration(
                                shadows: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ],
                                color: Color(0xFF8C9EB7),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 20
                                            : 10))),
                            child: Column(
                              children: [
                                FittedBox(
                                  child: Text(
                                    LocaleKeys.carPage_waterSensor.tr(),
                                    style: AppStyle.styleRegular25(context)
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                    fit: BoxFit.contain,
                                    width:
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 100
                                            : null,
                                    height:
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 100
                                            : null,
                                    'assets/images/auth_images/rainsensor.png')
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, tempSensorScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: MediaQuery.sizeOf(context).width < 500
                                ? 140
                                : MediaQuery.sizeOf(context).width > 500 &&
                                        MediaQuery.sizeOf(context).width < 600
                                    ? 150
                                    : null,
                            decoration: ShapeDecoration(
                                shadows: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ],
                                color: Color(0xFF8C9EB7),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 20
                                            : 10))),
                            child: Column(
                              children: [
                                FittedBox(
                                  child: Text(
                                    LocaleKeys.carPage_TempSensor.tr(),
                                    style: AppStyle.styleRegular25(context)
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                    fit: BoxFit.contain,
                                    width:
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 100
                                            : null,
                                    height:
                                        MediaQuery.sizeOf(context).width > 600
                                            ? 100
                                            : null,
                                    'assets/images/auth_images/temp.png')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
