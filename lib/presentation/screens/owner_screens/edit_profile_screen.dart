// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/core/logic/update_info_cubit/update_info_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late String userName;
  late String address;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    userName = BlocProvider.of<UpdateInfoCubit>(context).userName;
    address = BlocProvider.of<UpdateInfoCubit>(context).userAddress;
    userNameController.text = userName;
    addressController.text = address;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
            ? Color(0xFF1E1E1E)
            : Colors.white,
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
                        left: context.locale.languageCode == 'en' ? 10 : null,
                        right: context.locale.languageCode == 'en' ? null : 10,
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
                        top: MediaQuery.sizeOf(context).height * 0.25 - 60 - 4,
                        left: 40 - 4,
                        child: Container(
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(150)),
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
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              )),
                        )),
                    BlocBuilder<UpdateInfoCubit, UpdateInfoState>(
                      builder: (context, state) {
                        return Positioned(
                            left: 175,
                            top: MediaQuery.sizeOf(context).width > 600
                                ? MediaQuery.sizeOf(context).height * 0.25 - 60
                                : MediaQuery.sizeOf(context).height * 0.25 - 35,
                            child: Text(
                              BlocProvider.of<UpdateInfoCubit>(context)
                                  .userName,
                              style: AppStyle.styleBold25(context)
                                  .copyWith(color: Colors.white),
                            ));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BlocBuilder<UpdateInfoCubit, UpdateInfoState>(
                  builder: (context, state) {
                    if (state is UpdateInfoLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                              ? Colors.white
                              : MyColors.premiumColor,
                        ),
                      );
                    } else if (state is UpdateInfoError) {
                      return Center(
                        child: Text(
                          state.errMsg,
                          style: AppStyle.styleBold20(context).copyWith(
                              color: BlocProvider.of<ThemeCubit>(context).isDark
                                  ? Colors.white
                                  : Colors.red),
                        ),
                      );
                    } else if (state is UpdateInfoSuccess) {
                      BlocProvider.of<UpdateInfoCubit>(context).userName =
                          userNameController.text;
                      BlocProvider.of<UpdateInfoCubit>(context).userAddress =
                          addressController.text;
                      userName = CacheHelper().getData(
                        key: 'userName',
                      );
                      address = CacheHelper().getData(
                        key: 'address',
                      );
                      Fluttertoast.showToast(msg: state.message);
                    }
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.locale.languageCode == 'en'
                                ? 'My name'
                                : ' اسم المستخدم',
                            style: AppStyle.styleSemiBold20(context)
                                .copyWith(color: Color(0xFF979797)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // initialValue: 'ayman.ahmed@gmail.com',
                            controller: userNameController,
                            style: AppStyle.styleSemiBold20(context).copyWith(
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? Colors.white
                                        : Color(0xFF5C5858)),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
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
                              enabled: true,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return context.locale.languageCode == 'ar'
                                    ? 'الرجاء إدخال اسم المستخدم'
                                    : "Please enter your name";
                              }

                              return null;
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            context.locale.languageCode == 'en'
                                ? 'My address'
                                : ' العنوان',
                            style: AppStyle.styleSemiBold20(context)
                                .copyWith(color: Color(0xFF979797)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // initialValue: 'ismailia ,salah salem,street ',
                            controller: addressController,
                            style: AppStyle.styleSemiBold20(context).copyWith(
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? Colors.white
                                        : Color(0xFF5C5858)),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.place,
                                  color: BlocProvider.of<ThemeCubit>(context)
                                          .isDark
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

                            validator: (value) {
                              if (value!.isEmpty) {
                                return context.locale.languageCode == 'ar'
                                    ? 'الرجاء إدخال العنوان'
                                    : "Please enter your address";
                              }
                              return null;
                            },

                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          userNameController.text != userName ||
                                  addressController.text != address
                              ? SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        BlocProvider.of<UpdateInfoCubit>(
                                                context)
                                            .updateInfo(
                                                name: userNameController.text,
                                                address:
                                                    addressController.text);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor:
                                            BlocProvider.of<ThemeCubit>(context)
                                                    .isDark
                                                ? Colors.white
                                                : MyColors.premiumColor,
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          context.locale.languageCode == 'en'
                                              ? "Update"
                                              : "تحديث",
                                          style: AppStyle.styleBold20(context)
                                              .copyWith(
                                                  color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .isDark
                                                      ? Color(0xFF263238)
                                                      : Colors.white),
                                        ),
                                      )))
                              : SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          backgroundColor: Colors.grey),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          context.locale.languageCode == 'en'
                                              ? "Update"
                                              : "تحديث",
                                          style: AppStyle.styleBold20(context)
                                              .copyWith(
                                                  color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .isDark
                                                      ? Color(0xFF263238)
                                                      : Colors.white),
                                        ),
                                      )))
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }
}
