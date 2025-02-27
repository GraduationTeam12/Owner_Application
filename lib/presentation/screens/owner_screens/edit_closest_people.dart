import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/api/dio_consumer.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/change_password_fields.dart';

class EditClosestPeople extends StatefulWidget {
  const EditClosestPeople({super.key});

  @override
  State<EditClosestPeople> createState() => _EditClosestPeopleState();
}

class _EditClosestPeopleState extends State<EditClosestPeople> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController firstPhoneController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController secondPhoneController = TextEditingController();
  bool isLoading = true;

  final AuthRepository authRepository = AuthRepository(apiConsumer:DioConsumer(dio: Dio()));

  Future<void> fetchClosestPeople() async {
    final result = await authRepository.getClosestPeople();
    result.fold(
      (error) {
        print("Error fetching contacts: $error");
        setState(() => isLoading = false);
      },
      (people) {
        if (people.isNotEmpty) {
          setState(() {
            firstNameController.text = people[0].name;
            firstPhoneController.text = people[0].phone;
            if (people.length > 1) {
              secondNameController.text = people[1].name;
              secondPhoneController.text = people[1].phone;
            }
            isLoading = false;
          });
        } else {
          setState(() => isLoading = false);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchClosestPeople();
  }
  @override
void dispose() {
  firstNameController.dispose();
  firstPhoneController.dispose();
  secondNameController.dispose();
  secondPhoneController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF263238) : MyColors.premiumColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
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
                      ? Color(0xFF263238) : MyColors.premiumColor,
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
            "Edit Closest People",
            style: AppStyle.styleBold30(context).copyWith(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF1E1E1E) : Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'for your safety enter the names and numbers of the two people closest to you to inform them in the event of any danger to you.',
                  style: AppStyle.styleRegular22(context)
                      .copyWith(color: Color(0xFF979797)),
                ),
      
                SizedBox(
                  height: 40,
                ),
      
              Text(
                  LocaleKeys.Authentication_firstMemeber.tr(),
                  style: AppStyle.styleSemiBold22(context)
                      .copyWith(color: Color(0xFF979797)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                   controller: firstNameController,
                  style: AppStyle.styleRegular17(context)
                      .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Colors.black),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      errorStyle: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.red),
                      prefixIcon: Padding(
                        padding: MediaQuery.sizeOf(context).width > 600
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.all(0),
                        child: Icon(
                          Icons.person,
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Colors.black,
                          size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                        ),
                      ),
                      labelText: LocaleKeys.Authentication_fullName.tr(),
                      labelStyle: AppStyle.styleRegular17(context).copyWith(
                        color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Color(0xFF5C5858),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 0.5)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 2, color: MyColors.premiumColor)),
                      floatingLabelStyle: AppStyle.styleRegular16(context)
                          .copyWith(
                              color: MyColors.premiumColor,
                              fontWeight: FontWeight.w600),
                      contentPadding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.all(30)
                          : const EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 2, color: MyColors.premiumColor)),
                      border: buildBorder()),
                  // validator: (email) {
                  //   if (email!.isEmpty) {
                  //     return "Please enter your email";
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                   controller: firstPhoneController,
                  style: AppStyle.styleRegular17(context)
                      .copyWith(color: Colors.black),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      errorStyle: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.red),
                      prefixIcon: Padding(
                        padding: MediaQuery.sizeOf(context).width > 600
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.all(0),
                        child: Icon(
                          Icons.phone_iphone,
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Colors.black,
                          size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                        ),
                      ),
                      labelText: LocaleKeys.Authentication_phoneNumber.tr(),
                      labelStyle: AppStyle.styleRegular17(context).copyWith(
                        color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Color(0xFF5C5858),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 0.5)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 2, color: MyColors.premiumColor)),
                      floatingLabelStyle: AppStyle.styleRegular16(context)
                          .copyWith(
                              color: MyColors.premiumColor,
                              fontWeight: FontWeight.w600),
                      contentPadding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.all(30)
                          : const EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 2, color: MyColors.premiumColor)),
                      border: buildBorder()),
                  // validator: (email) {
                  //   if (email!.isEmpty) {
                  //     return "Please enter your email";
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  LocaleKeys.Authentication_secondMemeber.tr(),
                  style: AppStyle.styleSemiBold22(context)
                      .copyWith(color: Color(0xFF979797)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                   controller: secondNameController,
                  style: AppStyle.styleRegular17(context)
                      .copyWith(color: Colors.black),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      errorStyle: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.red),
                      prefixIcon: Padding(
                        padding: MediaQuery.sizeOf(context).width > 600
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.all(0),
                        child: Icon(
                          Icons.person,
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Colors.black,
                          size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                        ),
                      ),
                      labelText: LocaleKeys.Authentication_fullName.tr(),
                      labelStyle: AppStyle.styleRegular17(context).copyWith(
                        color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Color(0xFF5C5858),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 0.5)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 2, color: MyColors.premiumColor)),
                      floatingLabelStyle: AppStyle.styleRegular16(context)
                          .copyWith(
                              color: MyColors.premiumColor,
                              fontWeight: FontWeight.w600),
                      contentPadding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.all(30)
                          : const EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 2, color: MyColors.premiumColor)),
                      border: buildBorder()),
                  // validator: (email) {
                  //   if (email!.isEmpty) {
                  //     return "Please enter your email";
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                   controller: secondPhoneController,
                  style: AppStyle.styleRegular17(context)
                      .copyWith(color: Colors.black),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      errorStyle: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.red),
                      prefixIcon: Padding(
                        padding: MediaQuery.sizeOf(context).width > 600
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.all(0),
                        child: Icon(
                          Icons.phone_iphone,
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Colors.black,
                          size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                        ),
                      ),
                      labelText: LocaleKeys.Authentication_phoneNumber.tr(),
                      labelStyle: AppStyle.styleRegular17(context).copyWith(
                        color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Color(0xFF5C5858),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 0.5)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 2, color: MyColors.premiumColor)),
                      floatingLabelStyle: AppStyle.styleRegular16(context)
                          .copyWith(
                              color: MyColors.premiumColor,
                              fontWeight: FontWeight.w600),
                      contentPadding: MediaQuery.sizeOf(context).width > 600
                          ? const EdgeInsets.all(30)
                          : const EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 2, color: MyColors.premiumColor)),
                      border: buildBorder()),
                  // validator: (email) {
                  //   if (email!.isEmpty) {
                  //     return "Please enter your email";
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width:  double.infinity,
                  height: MediaQuery.sizeOf(context).width > 600 ? 80 : 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : MyColors.premiumColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          // عرض مؤشر التحميل
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                                child: CircularProgressIndicator()),
                          );

                          try {
                            bool success = await AuthRepository(
                                    apiConsumer: DioConsumer(dio: Dio()))
                                .addEmergencyContacts([
                              {
                                "name": firstNameController.text,
                                "phone": firstPhoneController.text,
                                "address": "XXXXXXX",
                                "priority": 1
                              },
                              {
                                "name": secondNameController.text,
                                "phone": secondPhoneController.text,
                                "address": "XXXXXXX",
                                "priority": 2
                              }
                            ]);

                            Navigator.pop(context);

                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Contacts updated successfully!"),
                                  backgroundColor: Colors.green,
                                   duration: Duration(seconds: 1)
                                ),
                              );

                              
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Error updating contacts"),
                                  backgroundColor: Colors.red,
                                   duration: Duration(seconds: 1)
                                ),
                              );
                            }
                          } catch (e) {
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Server connection error: ${e.toString()}"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        
                      child: Text(
                        "Save",
                        style: AppStyle.styleBold20(context)
                            .copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Color(0xFF263238) : Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
