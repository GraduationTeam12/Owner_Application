// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';

class CircularGauge extends StatelessWidget {
  const CircularGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 300,
          startAngle: 180,
          // endAngle: 300,
          showLabels: false,
          showTicks: true,
          interval: 70,
          canScaleToFit: false,
          ticksPosition: ElementsPosition.outside,
          radiusFactor: MediaQuery.sizeOf(context).width > 600 &&
                  MediaQuery.sizeOf(context).width < 1000
              ? 1.2
              : MediaQuery.sizeOf(context).width > 1000
                  ? 1.2
                  : 1.0,
          majorTickStyle: MajorTickStyle(
              length: MediaQuery.sizeOf(context).width > 600 ? 16 : 8,
              thickness: MediaQuery.sizeOf(context).width > 600 ? 12 : 5,
              color: Colors.black26,
              lengthUnit: GaugeSizeUnit.logicalPixel),
          minorTicksPerInterval: 10,
          minorTickStyle: MinorTickStyle(
              length: MediaQuery.sizeOf(context).width > 600 ? 12 : 5,
              thickness: MediaQuery.sizeOf(context).width > 600 ? 5 : 1,
              color: Colors.black26,
              lengthUnit: GaugeSizeUnit.logicalPixel),
          axisLineStyle: AxisLineStyle(
            thickness: MediaQuery.sizeOf(context).width > 600 ? 12 : 5,
            color: Colors.red,
            thicknessUnit: GaugeSizeUnit.logicalPixel,
          ),
          pointers: <GaugePointer>[
            MarkerPointer(
              value: 0,
              markerHeight: MediaQuery.sizeOf(context).width > 600 ? 30 : 15,
              markerWidth: MediaQuery.sizeOf(context).width > 600 ? 30 : 15,
              markerType: MarkerType.circle,
              color: Colors.white,
              borderColor: MyColors.premiumColor,
              borderWidth: 5,
              enableAnimation: true,
              animationDuration: 2500,
            ),
            MarkerPointer(
              value: 300,
              markerHeight: MediaQuery.sizeOf(context).width > 600 ? 30 : 15,
              markerWidth: MediaQuery.sizeOf(context).width > 600 ? 30 : 15,
              markerType: MarkerType.circle,
              color: Colors.white,
              borderColor: Colors.orange,
              borderWidth: 5,
              enableAnimation: true,
              animationDuration: 2500,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                height: MediaQuery.sizeOf(context).width > 600 ? 400 : 200,
                width: MediaQuery.sizeOf(context).width > 600 ? 400 : 200,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                      )
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500))),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('100.11°',
                        style: AppStyle.styleBold30(context).copyWith(
                            color: Colors.black, fontFamily: 'Roboto')),
                    SizedBox(
                      height: 15,
                    ),
                    FittedBox(
                      child: Text('Problem',
                          style: AppStyle.styleBold40(context).copyWith(
                            color: Color(0xFF5C5858),
                            fontFamily: 'Roboto',
                          )),
                    ),
                  ],
                ),
              ),
              angle: 90,
              positionFactor: 0.1,
            ),
          ],
        ),
      ],
    );
  }
}
