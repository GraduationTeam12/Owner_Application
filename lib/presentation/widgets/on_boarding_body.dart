import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/models/on_board_model_pageview.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    List<OnBoardModelPageview> items = [
      OnBoardModelPageview(
          img: Assets.imagesAuthImagesOnBoarding1,
          title: LocaleKeys.onBoarding_team.tr(),
          description1: context.locale.languageCode == 'ar'
              ? "نحن فريق متماسك يسعى لتحقيق وضمان السلامة للجميع."
              : "We are a cohesive team striving to achieve and",
          discription2: context.locale.languageCode == 'ar'
              ? ''
              : "ensure safety for everyone."),
      OnBoardModelPageview(
          img: Assets.imagesAuthImagesOnBoarding2,
          title: LocaleKeys.onBoarding_goal.tr(),
          description1: context.locale.languageCode == 'ar'
              ? 'الهدف هو تسهيل الوصول الفوري لفرق الإنقاذ'
              : "The goal is to facilitate the prompt arrival of",
          discription2: context.locale.languageCode == 'ar'
              ? 'إلى أقرب مستشفى أو مركز طوارئ.'
              : "rescue teams at the nearest hospital or",
          discription3:
              context.locale.languageCode == 'ar' ? '' : "emergency center."),
      OnBoardModelPageview(
          img: Assets.imagesAuthImagesOnBoarding3,
          title: LocaleKeys.onBoarding_vision.tr(),
          description1: context.locale.languageCode == 'ar'
              ? 'يهدف مشروع التحسين باستخدام أجهزة الاستشعار إلى إحداث ثورة في'
              : "Improvement Project using sensors is to",
          discription2: context.locale.languageCode == 'ar'
              ? 'كيفية إدارة حوادث الطرق من خلال دمج التكنولوجيا المتقدمة'
              : "revolutionize how road accidents are managed",
          discription3: context.locale.languageCode == 'ar'
              ? ''
              : "by integrating advanced technology"),
    ];
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width > 600
                ? MediaQuery.sizeOf(context).width / 2
                : null,
            height: MediaQuery.sizeOf(context).width > 600
                ? MediaQuery.of(context).size.height / 3
                : null,
            child: SvgPicture.asset(
              items[index].img,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Center(
          child: Text(
            items[index].title,
            style: AppStyle.styleBold30(context),
          ),
        ),
        const SizedBox(height: 15),
        FittedBox(
          child: Column(
            children: [
              Text(items[index].description1,
                  style: AppStyle.styleRegular17(context)
                      .copyWith(fontWeight: FontWeight.w600)),
              Text(items[index].discription2,
                  style: AppStyle.styleRegular17(context)
                      .copyWith(fontWeight: FontWeight.w600)),
              Text(items[index].discription3 ?? '',
                  style: AppStyle.styleRegular17(context)
                      .copyWith(fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ],
    );
  }
}
