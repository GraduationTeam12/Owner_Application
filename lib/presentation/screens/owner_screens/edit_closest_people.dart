import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/change_password_fields.dart';

class EditClosestPeople extends StatefulWidget {
  const EditClosestPeople({super.key});

  @override
  State<EditClosestPeople> createState() => _EditClosestPeopleState();
}

class _EditClosestPeopleState extends State<EditClosestPeople> {
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
              color: MyColors.premiumColor,
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
          backgroundColor: MyColors.premiumColor,
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
                          color: Colors.black,
                          size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                        ),
                      ),
                      labelText: LocaleKeys.Authentication_fullName.tr(),
                      labelStyle: AppStyle.styleRegular17(context),
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
                          color: Colors.black,
                          size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                        ),
                      ),
                      labelText: LocaleKeys.Authentication_phoneNumber.tr(),
                      labelStyle: AppStyle.styleRegular17(context),
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
                          color: Colors.black,
                          size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                        ),
                      ),
                      labelText: LocaleKeys.Authentication_fullName.tr(),
                      labelStyle: AppStyle.styleRegular17(context),
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
                          color: Colors.black,
                          size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                        ),
                      ),
                      labelText: LocaleKeys.Authentication_phoneNumber.tr(),
                      labelStyle: AppStyle.styleRegular17(context),
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
                          backgroundColor: MyColors.premiumColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                       
                      },
                      child: Text(
                        "Save",
                        style: AppStyle.styleBold20(context)
                            .copyWith(color: Colors.white),
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
