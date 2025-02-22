import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';

class PartDiagramSensorChart extends StatelessWidget {
  const PartDiagramSensorChart(
      {super.key,
      required this.title,
      required this.percent,
      required this.myColor});
  final String title;
  final double percent;
  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: percent),
      duration: const Duration(milliseconds: 2000),
      builder: (context, animatedPercent, child) {
        return CircularPercentIndicator(
          radius: MediaQuery.sizeOf(context).width > 600 ? 200 :  100,
          lineWidth: MediaQuery.sizeOf(context).width > 600 ? 16 : 10.0,
          animation: true,
          percent: percent,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(animatedPercent * 100).toInt()}%",
                style: AppStyle.styleSemiBold22(context).copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Colors.black),
              ),

              SizedBox(height: 15,),
              Text(
                title,
                style: AppStyle.styleSemiBold22(context).copyWith(color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white : Colors.black),
              )
            ],
          ),
          // header: Text(
          //   title,
          //   style: const TextStyle(
          //       fontSize: 19,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //       fontFamily: "Inter"),
          // ),
          backgroundWidth: MediaQuery.sizeOf(context).width > 600 ? 16 : 10,
          animationDuration: 2000,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: myColor,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
