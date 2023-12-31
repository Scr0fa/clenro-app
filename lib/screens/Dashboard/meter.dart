import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../details.dart';

class RadialGaugeWidget extends StatelessWidget {
  final double pm25Value;
  final String pm25Remarks;

  RadialGaugeWidget({required this.pm25Value, required this.pm25Remarks});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green[700],
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  startAngle: 173,
                  endAngle: 8,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 10,
                    color: Colors.white,
                    thicknessUnit: GaugeSizeUnit.logicalPixel,
                  ),
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: pm25Value,
                      needleLength: 0.8,
                      lengthUnit: GaugeSizeUnit.factor,
                      needleColor: Colors.black,
                      needleStartWidth: 1,
                      needleEndWidth: 10,
                      tailStyle: TailStyle(
                        width: 1,
                        length: 0,
                      ),
                    ),
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 25,
                      color: Colors.green,
                    ),
                    GaugeRange(
                      startValue: 25.1,
                      endValue: 35,
                      color: Colors.yellow,
                    ),
                    GaugeRange(
                      startValue: 35.1,
                      endValue: 45,
                      color: Colors.orange,
                    ),
                    GaugeRange(
                      startValue: 45.1,
                      endValue: 55,
                      color: Colors.red,
                    ),
                    GaugeRange(
                      startValue: 55.1,
                      endValue: 90,
                      color: Colors.purple,
                    ),
                    GaugeRange(
                      startValue: 91,
                      endValue: 100,
                      color: Color(0xFF934B50),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 163,
              right: 108,
              child: Container(
                width: 140,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigate to the DetailsPage class when the "Details" button is tapped.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage(selectedItem: {},)), // Replace DetailsPage() with your actual DetailsPage class constructor.
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '>',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Positioned(
              top: 48,
              right: 122,
              child: Container(
                width: 120,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      pm25Value.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "PM 2.5",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  pm25Remarks,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
