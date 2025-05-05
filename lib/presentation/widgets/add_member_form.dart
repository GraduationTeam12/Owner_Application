import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/logic/closeset_member/closest_members_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/forgot_password_email_field.dart';
import 'package:user_app/presentation/widgets/loading_dialog.dart';

class AddMemberForm extends StatefulWidget {
  const AddMemberForm({
    super.key,
  });

  @override
  State<AddMemberForm> createState() => _AddMemberFormState();
}

class _AddMemberFormState extends State<AddMemberForm> {
  final TextEditingController firstMemberNameController =
      TextEditingController();
  final TextEditingController firstMemberPhoneController =
      TextEditingController();
  final TextEditingController secondMemberNameController =
      TextEditingController();
  final TextEditingController secondMemberPhoneController =
      TextEditingController();

  @override
  void dispose() {
    firstMemberNameController.dispose();
    firstMemberPhoneController.dispose();
    secondMemberNameController.dispose();
    secondMemberPhoneController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClosestMembersCubit, ClosestMembersState>(
      listener: (context, state) {
        if (state is AddClosestMembersLoading) {
          showLoadingDialog(context);
        }
        if (state is AddClosestMembersSuccess) {
          Navigator.pop(context);
          String message = state.message;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
          Navigator.pushNamedAndRemoveUntil(
              context, carSplashScreen, (route) => false);
        }

        if (state is AddClosestMembersError) {
          Navigator.pop(context);
          String message = state.error;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              )),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.Authentication_firstMemeber.tr(),
                      style: AppStyle.styleSemiBold22(context)
                          .copyWith(color: const Color(0xFF979797)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: firstMemberNameController,
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
                              size: MediaQuery.sizeOf(context).width > 600
                                  ? 40
                                  : 25,
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
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: firstMemberPhoneController,
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
                              size: MediaQuery.sizeOf(context).width > 600
                                  ? 40
                                  : 25,
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
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Please enter phone number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      LocaleKeys.Authentication_secondMemeber.tr(),
                      style: AppStyle.styleSemiBold22(context)
                          .copyWith(color: const Color(0xFF979797)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: secondMemberNameController,
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
                              size: MediaQuery.sizeOf(context).width > 600
                                  ? 40
                                  : 25,
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
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: secondMemberPhoneController,
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
                              size: MediaQuery.sizeOf(context).width > 600
                                  ? 40
                                  : 25,
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
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Please enter phone number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width > 600
                              ? 230
                              : 150,
                          height:
                              MediaQuery.sizeOf(context).width > 600 ? 80 : 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.premiumColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                } else {
                                  context
                                      .read<ClosestMembersCubit>()
                                      .addEmergencyContacts(
                                        firstMemberNameController.text,
                                        firstMemberPhoneController.text,
                                        secondMemberNameController.text,
                                        secondMemberPhoneController.text,
                                      );
                                }
                              },
                              child: Text(
                                LocaleKeys.Authentication_add.tr(),
                                style: AppStyle.styleBold20(context)
                                    .copyWith(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.sizeOf(context).width > 600 ? 30 : 15,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width > 600
                              ? 230
                              : 150,
                          height:
                              MediaQuery.sizeOf(context).width > 600 ? 80 : 50,
                          decoration: const BoxDecoration(),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.5,
                                          color: MyColors.premiumColor),
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, carSplashScreen , (route) => false);
                              },
                              child: Text(
                                LocaleKeys.Authentication_skip.tr(),
                                style: AppStyle.styleBold20(context)
                                    .copyWith(color: MyColors.premiumColor),
                              )),
                        ),
                      ],
                    ),
                      SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
