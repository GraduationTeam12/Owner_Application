import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/logic/logout_cubit/logout_cubit.dart';
import 'package:user_app/core/logic/logout_cubit/logout_state.dart';
import 'package:user_app/generated/locale_keys.g.dart';

void showLogOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return BlocProvider.value(
          value: BlocProvider.of<LogoutCubit>(context),
          child: BlocConsumer<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccessState) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                 signInScreen,
                  (routes) => false,
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 55,
                ),
                child: AlertDialog(
                    scrollable: true,
                    titlePadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close)),
                        const SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Text(
                            LocaleKeys.LogOutDialog_headerText.tr(),
                            style: AppStyle.styleSemiBold22(context)
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  backgroundColor: const WidgetStatePropertyAll(
                                    Color.fromRGBO(61, 100, 152, 1),
                                  ),
                                  padding: const WidgetStatePropertyAll(
                                      EdgeInsets.only(
                                          right: 20,
                                          left: 20,
                                          top: 6,
                                          bottom: 6))),
                              child: Text(LocaleKeys.LogOutDialog_no.tr(),
                                  style: AppStyle.styleBold16(context).copyWith(
                                      color: Colors.white,
                                      fontFamily: 'Roboto')),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<LogoutCubit>(context).logout();
                              },
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  side: const WidgetStatePropertyAll(
                                    BorderSide(
                                        color: Color.fromRGBO(255, 180, 65, 1),
                                        width: 2),
                                  ),
                                  padding: const WidgetStatePropertyAll(
                                      EdgeInsets.only(
                                          right: 20,
                                          left: 20,
                                          top: 6,
                                          bottom: 6))),
                              child: Text(LocaleKeys.LogOutDialog_yes.tr(),
                                  style: AppStyle.styleBold16(context).copyWith(
                                      color: Color(0xFF565656),
                                      fontFamily: 'Roboto')),
                            )
                          ],
                        )
                      ],
                    )),
              );
            },
          ));
    },
  );
}
