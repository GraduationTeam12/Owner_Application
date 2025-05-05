
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/data/model/closest_people_model.dart';
import 'package:user_app/core/logic/closeset_member/closest_members_cubit.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    BlocProvider.of<ClosestMembersCubit>(context).getClosestMembers();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    firstPhoneController.dispose();
    secondNameController.dispose();
    secondPhoneController.dispose();
    super.dispose();
  }

  List<ClosestPersonModel>? closestPeople = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).isDark
                  ? Color(0xFF263238)
                  : MyColors.premiumColor,
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
              ? Color(0xFF263238)
              : MyColors.premiumColor,
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
            context.locale == Locale("ar")
                ? "تعديل الأشخاص القريبين منك"
                : "Edit Closest People",
            style: AppStyle.styleBold30(context).copyWith(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
            ? Color(0xFF1E1E1E)
            : Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BlocBuilder<ClosestMembersCubit, ClosestMembersState>(
              builder: (context, state) {
                if (state is ClosestMembersLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: MyColors.premiumColor,
                    ),
                  );
                }

                if (state is ClosestMembersSuccess) {
                  closestPeople = state.closestMembers;
                }

                if (state is ClosestMembersError) {
                  final error = state.error;
                  return Center(
                    child: Text(
                      error,
                      style: AppStyle.styleRegular22(context).copyWith(
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                              ? Colors.white
                              : Colors.black),
                    ),
                  );
                }

                if (state is AddClosestMembersLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: MyColors.premiumColor,
                    ),
                  );
                }

                if (state is AddClosestMembersSuccess) {
                  final message = state.message;
                  context.read<ClosestMembersCubit>().getClosestMembers();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        message,
                        style: AppStyle.styleRegular22(context).copyWith(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : Colors.black),
                      ),
                      backgroundColor: MyColors.premiumColor,
                    ),
                  );
                }

                if (state is ClosestMembersError) {
                  final error = state.error;
                  return Center(
                    child: Text(
                      error,
                      style: AppStyle.styleRegular22(context).copyWith(
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                              ? Colors.white
                              : Colors.black),
                    ),
                  );
                }

                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.locale == Locale("ar")
                            ? "من فضلك قم بإدخال أسماء ورقمهما للشخص الأقرب منك في حالة أي خطر لك"
                            : 'for your safety enter the names and numbers of the two people closest to you to inform them in the event of any danger to you.',
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
                        controller: closestPeople == null ? firstNameController : null,
                        initialValue: closestPeople != null
                            ? closestPeople![0].name
                            : null,
                        style: AppStyle.styleRegular17(context).copyWith(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : Colors.black),
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
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? Colors.white
                                        : Colors.black,
                                size: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 25,
                              ),
                            ),
                            enabledBorder: buildBorder(context),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: MyColors.premiumColor)),
                            floatingLabelStyle: AppStyle.styleRegular16(context)
                                .copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600),
                            contentPadding:
                                MediaQuery.sizeOf(context).width > 600
                                    ? const EdgeInsets.all(30)
                                    : const EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: MyColors.premiumColor)),
                            border: buildBorder(
                              context,
                            ),
                            disabledBorder: buildBorder(context)),
                        validator: (email) {
                          if (email!.isEmpty) {
                            return context.locale == Locale("ar") ? "يرجى ادخال البريد الالكتروني" : "Please enter email";
                          }
                          return null;
                        },
                        enabled: closestPeople != null ? false : true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        enabled: closestPeople != null ? false : true,
                        controller: closestPeople == null ? firstPhoneController : null ,
                        initialValue: closestPeople != null
                            ? closestPeople![0].phone
                            : null,
                        style: AppStyle.styleRegular17(context).copyWith(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : Colors.black),
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
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? Colors.white
                                        : Colors.black,
                                size: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 25,
                              ),
                            ),
                            enabledBorder: buildBorder(context),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: MyColors.premiumColor)),
                            floatingLabelStyle: AppStyle.styleRegular16(context)
                                .copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600),
                            contentPadding:
                                MediaQuery.sizeOf(context).width > 600
                                    ? const EdgeInsets.all(30)
                                    : const EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: MyColors.premiumColor)),
                            border: buildBorder(context)),
                        validator: (email) {
                          if (email!.isEmpty) {
                            return context.locale == Locale('ar') ? "يرجى ادخال رقم الجوال" : "Please enter phone number";
                          }
                          return null;
                        },
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
                        controller: closestPeople == null ? secondNameController : null,
                        enabled: closestPeople != null ? false : true,
                        initialValue: closestPeople != null
                            ? closestPeople![1].name
                            : null,
                        style: AppStyle.styleRegular17(context).copyWith(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : Colors.black),
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
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? Colors.white
                                        : Colors.black,
                                size: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 25,
                              ),
                            ),
                            enabledBorder: buildBorder(context),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: MyColors.premiumColor)),
                            floatingLabelStyle: AppStyle.styleRegular16(context)
                                .copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600),
                            contentPadding:
                                MediaQuery.sizeOf(context).width > 600
                                    ? const EdgeInsets.all(30)
                                    : const EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: MyColors.premiumColor)),
                            border: buildBorder(context)),
                        validator: (email) {
                          if (email!.isEmpty) {
                            return context.locale.languageCode == 'ar' ? "يرجى ادخال البريد" : "Please enter email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: closestPeople == null ? secondPhoneController : null,
                        enabled: closestPeople != null ? false : true,
                        initialValue: closestPeople != null
                            ? closestPeople![1].phone
                            : null,
                        style: AppStyle.styleRegular17(context).copyWith(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? Colors.white
                                : Colors.black),
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
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? Colors.white
                                        : Colors.black,
                                size: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 25,
                              ),
                            ),
                            enabledBorder: buildBorder(context),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: MyColors.premiumColor)),
                            floatingLabelStyle: AppStyle.styleRegular16(context)
                                .copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600),
                            contentPadding:
                                MediaQuery.sizeOf(context).width > 600
                                    ? const EdgeInsets.all(30)
                                    : const EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: MyColors.premiumColor)),
                            border: buildBorder(context)),
                        validator: (email) {
                          if (email!.isEmpty) {
                            return context.locale == Locale('ar') ? "يرجى ادخال رقم الهاتف" : "Please enter phone number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      closestPeople != null
                          ? Container()
                          : SizedBox(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).width > 600
                                  ? 80
                                  : 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          BlocProvider.of<ThemeCubit>(context)
                                                  .isDark
                                              ? Colors.white
                                              : MyColors.premiumColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () async {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    } else {
                                      context
                                          .read<ClosestMembersCubit>()
                                          .addEmergencyContacts(
                                            firstNameController.text,
                                            firstPhoneController.text,
                                            secondNameController.text,
                                            secondPhoneController.text,
                                          );
                                    }
                                  },
                                  child: Text(
                                    context.locale.languageCode == 'ar'
                                        ? "حفظ"
                                        : "Save",
                                    style: AppStyle.styleBold20(context)
                                        .copyWith(
                                            color: BlocProvider.of<ThemeCubit>(
                                                        context)
                                                    .isDark
                                                ? Color(0xFF263238)
                                                : Colors.white),
                                  )),
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
