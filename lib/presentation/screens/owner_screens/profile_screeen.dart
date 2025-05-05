// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';

class ProfileScreeen extends StatelessWidget {
  const ProfileScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = CacheHelper().getData(key: 'userName');
    final String address = CacheHelper().getData(key: 'address');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.36,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ],
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                              ? Color(0xFF263238)
                              : null,
                          gradient: BlocProvider.of<ThemeCubit>(context).isDark
                              ? null
                              : LinearGradient(colors: [
                                  Color(0xFF142132),
                                  Color(0xFF294265),
                                  Color(0xFF3D6498)
                                ]),
                          shape: RoundedRectangleBorder()),
                    ),
                  ],
                ),
               
                Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.25 - 60,
                    left: 40,
                    child: ClipOval(
                      child: Image.asset(
                          width: 120,
                          height: 120,
                          Assets.imagesAuthImagesDrawerphoto),
                    )),
                Positioned(
                    left: 135,
                    top: MediaQuery.sizeOf(context).height * 0.25 - 60,
                    child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ))),
                Positioned(
                    left: 175,
                    top: MediaQuery.sizeOf(context).width > 600
                        ? MediaQuery.sizeOf(context).height * 0.25 - 60
                        : MediaQuery.sizeOf(context).height * 0.25 - 35,
                    child: Text(
                      userName,
                      style: AppStyle.styleBold25(context)
                          .copyWith(color: Colors.white),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.locale.languageCode == 'ar'
                      ? ' اسم المستخدم'
                      : 'My name',
                    
                  style: AppStyle.styleSemiBold20(context)
                      .copyWith(color: Color(0xFF979797)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  enabled: false,
                  initialValue:  userName,
                  style: AppStyle.styleSemiBold20(context).copyWith(
                      color: BlocProvider.of<ThemeCubit>(context).isDark
                          ? Colors.white
                          : Color(0xFF5C5858)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: BlocProvider.of<ThemeCubit>(context).isDark
                            ? Colors.white
                            : Color(0xFF5C5858),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyColors.premiumColor, width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabled: true),
                ),
                SizedBox(
                  height: 20,
                ),
               
                Text(
                  context.locale.languageCode == 'en'
                      ? 'My address'
                      : 'العنوان',
                  style: AppStyle.styleSemiBold20(context)
                      .copyWith(color: Color(0xFF979797)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: address,
                  enabled: false,
                  style: AppStyle.styleSemiBold20(context).copyWith(
                      color: BlocProvider.of<ThemeCubit>(context).isDark
                          ? Colors.white
                          : Color(0xFF5C5858)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.place,
                        color: BlocProvider.of<ThemeCubit>(context).isDark
                            ? Colors.white
                            : Color(0xFF5C5858),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabled: true),
                ),
                SizedBox(
                  height: 30,
                ),
                // SizedBox(
                //     width: double.infinity,
                //     child: ElevatedButton(
                //         onPressed: () {},
                //         style: ElevatedButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10)),
                //           backgroundColor:
                //               BlocProvider.of<ThemeCubit>(context).isDark
                //                   ? Colors.white
                //                   : MyColors.premiumColor,
                //         ),
                //         child: Padding(
                //           padding: EdgeInsets.symmetric(vertical: 10),
                //           child: Text(
                //             "Update",
                //             style: AppStyle.styleBold20(context).copyWith(
                //                 color:
                //                     BlocProvider.of<ThemeCubit>(context).isDark
                //                         ? Color(0xFF263238)
                //                         : Colors.white),
                //           ),
                //         ))),

                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
