import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/presentation/widgets/change_password_fields.dart';
import 'package:user_app/presentation/widgets/custom_app_bar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildCustomAppBar(context, context.locale == Locale('en') ? 'Change Password' : ' تغيير كلمة المرور',),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width > 600
                            ? MediaQuery.sizeOf(context).width / 2
                            : null,
                        height: MediaQuery.sizeOf(context).width > 600
                            ? MediaQuery.of(context).size.height / 3
                            : null,
                        child: SvgPicture.asset(
                          Assets.imagesAuthImagesConfirm,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                       ChangePasswordFields(
                        email: email,
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
