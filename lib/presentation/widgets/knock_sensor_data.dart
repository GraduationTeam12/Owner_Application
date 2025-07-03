import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/generated/locale_keys.g.dart';
import 'package:user_app/presentation/widgets/diagram_charts.dart';

class KnockSensorData extends StatelessWidget {
  const KnockSensorData({
    super.key,
    required this.boardData,
  });

  final dynamic boardData;
  String _translateStatus(String status) {
  switch (status.toLowerCase()) {
    case 'normal':
      return 'طبيعي';
    case 'dangerous':
      return 'خطر';
    case 'medium':
      return 'متوسط';
    default:
      return status;
  }
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, left: 20, right: 20),
              child: Text(
                LocaleKeys.knockSensorPage_title.tr(),
                style: AppStyle.styleBold25(context).copyWith(
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Colors.white
                        : null),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                LocaleKeys.knockSensorPage_subtitle.tr(),
                style: AppStyle.styleRegular17(context).copyWith(
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Colors.white
                        : Color(0xFF9B9090)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                LocaleKeys.knockSensorPage_center.tr(),
                style: AppStyle.styleRegular20(context).copyWith(
                    fontFamily: 'Roboto',
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Colors.white
                        : Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height:
                    MediaQuery.sizeOf(context).width > 600 ? 500 : 300,
                width: double.infinity,
                decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                          blurRadius: 4,
                          color: Colors.grey),
                    ],
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Color(0xFF1E1E1E)
                        : Color(0xFFE0E0E0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: PartDiagramSensorChart(
                    title: context.locale.languageCode == 'ar'
    ? _translateStatus(boardData['sensors']['Collision']['statusNow'])
    : boardData['sensors']['Collision']['statusNow'],

                    percent: boardData['sensors']['Collision']
                            ['value1'] *
                        .01,
                    myColor: Colors.red),
              ),
            ),
            SizedBox(
                height:
                    MediaQuery.sizeOf(context).width > 600 ? 135 : 75),
          ],
        ),
      ),
    );
  }
}
