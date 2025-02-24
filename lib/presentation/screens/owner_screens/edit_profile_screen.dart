// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF1E1E1E) : Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
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
                              gradient:
                                  BlocProvider.of<ThemeCubit>(context).isDark
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
                        top: 70,
                        left: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        )),
                          Positioned(
                        top: MediaQuery.sizeOf(context).height * 0.25 - 60-4,
                        left: 40-4,
                        child:Container(
                            width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(150)
                          ),
                        )),
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
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(224, 224, 224, 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              )),
                        )),
                    Positioned(
                        left: 175,
                        top: MediaQuery.sizeOf(context).width > 600
                            ? MediaQuery.sizeOf(context).height * 0.25 - 60
                            : MediaQuery.sizeOf(context).height * 0.25 - 35,
                        child: Text(
                          'Ayman Ahmed',
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
                      'My email',
                      style: AppStyle.styleSemiBold20(context)
                          .copyWith(color: Color(0xFF979797)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: 'ayman.ahmed@gmail.com',
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
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabled: true),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'My phone number',
                      style: AppStyle.styleSemiBold20(context)
                          .copyWith(color: Color(0xFF979797)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: '01225050505',
                      style: AppStyle.styleSemiBold20(context).copyWith(
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                              ? Colors.white
                              : Color(0xFF5C5858)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_iphone,
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
                      height: 20,
                    ),
                    Text(
                      'My address',
                      style: AppStyle.styleSemiBold20(context)
                          .copyWith(color: Color(0xFF979797)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: 'ismailia ,salah salem,street ',
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
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor:
                                  BlocProvider.of<ThemeCubit>(context).isDark
                                      ? Colors.white
                                      : MyColors.premiumColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Update",
                                style: AppStyle.styleBold20(context).copyWith(
                                    color: BlocProvider.of<ThemeCubit>(context)
                                            .isDark
                                        ? Color(0xFF263238)
                                        : Colors.white),
                              ),
                            )))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
