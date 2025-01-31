import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:user_app/constants/app_style.dart';

class SensorChart extends StatelessWidget {
  const SensorChart({super.key, required this.percent, required this.title});

  final String percent;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          startAngle: 180,
          endAngle: 0,
          showLabels: false,
          showTicks: false,
          radiusFactor: MediaQuery.sizeOf(context).width > 600 ? 1.6 : 0.8,
          axisLineStyle: AxisLineStyle(
            thickness: 0.15,
            cornerStyle: CornerStyle.bothCurve,
            color: Colors.grey[300],
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: 15.66,
              width: 0.15,
              sizeUnit: GaugeSizeUnit.factor,
              color: Colors.red,
              enableAnimation: true,
              animationDuration: 2000,
              animationType: AnimationType.ease,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: MediaQuery.sizeOf(context).width > 600 ? 0 : 38,
                    child: Text(percent,
                        style: AppStyle.styleBold30(context).copyWith(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                        )),
                  ),
                  Positioned(
                    top: MediaQuery.sizeOf(context).width > 600 ? 78 : 150,
                    child: Text(title,
                        style: AppStyle.styleBold40(context).copyWith(
                          color: Color(0xFF5C5858),
                          fontFamily: 'Roboto',
                        )),
                  ),
                ],
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}
