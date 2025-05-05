
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';

class ResetPasswordText extends StatelessWidget {
  const ResetPasswordText({
    super.key,
    required this.email,
  });

  final email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: context.locale.languageCode == 'ar' ? [

        FittedBox(
          child: Text('الرجاء إدخال الرمز المكون من 6 أرقام المرسل إلى:',
          style: AppStyle.styleRegular25(context)
                    .copyWith(fontWeight: FontWeight.w600 , color:  Color(0xFF5C5858)),
          ),
        ),

        Text('$email',
                    style: AppStyle.styleRegular17(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: MyColors.premiumColor))
      ] : [
        FittedBox(
            child: Text("Please enter the 6 digit code",
                style: AppStyle.styleRegular17(context)
                    .copyWith(fontWeight: FontWeight.w600))),
        FittedBox(
          child: RichText(
              text: TextSpan(
                  text: " sent to: ",
                  style: AppStyle.styleRegular17(context)
                      .copyWith(fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                TextSpan(
                    text:
                    //  'you@example.com',
                     '$email',
                    style: AppStyle.styleRegular17(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: MyColors.premiumColor)),
              ])),
        ),
      ],
    );
  }
}
