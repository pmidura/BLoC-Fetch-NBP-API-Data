import 'package:bloc_fetch_api_data/utils/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/mid_model.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.tooltipDate,
    required this.midList,
  });

  final DateFormat tooltipDate;
  final List<MidModel> midList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      margin: const EdgeInsets.only(top: 30.0),
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(
              show: false,
            ),
            gridData: FlGridData(
              show: false,
            ),
            titlesData: FlTitlesData(
              show: false,
            ),
            lineTouchData: LineTouchData(
              getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) =>
                spotIndexes.map((index) =>
                  TouchedSpotIndicatorData(
                    FlLine(
                      color: Colors.white.withOpacity(0.1),
                      strokeWidth: 2,
                      dashArray: [3, 3],
                    ),
                    FlDotData(
                      show: true,
                    ),
                  ),
                ).toList(),
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipRoundedRadius: 8.0,
                showOnTopOfTheChartBoxArea: true,
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                tooltipPadding:
                const EdgeInsets.all(8.0),
                tooltipBgColor: const Color(0xff2e3747).withOpacity(0.8),
                getTooltipItems: (touchedSpots) =>
                  touchedSpots.map((touchedSpot) =>
                    LineTooltipItem(
                      '${tooltipDate.format(midList[touchedSpot.x.toInt()].effectiveDate)}\n\nKurs: ',
                      white14(),
                      children: [
                        TextSpan(
                          text: touchedSpot.y.toStringAsFixed(4),
                          style: white14Bold(),
                        ),
                      ],
                    ),
                  ).toList(),
              ),
              handleBuiltInTouches: true,
            ),
            lineBarsData: [
              LineChartBarData(
                spots: midList
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value.mid)).toList(),
                isCurved: true,
                colors: [
                  const Color(0xffe68823),
                  const Color(0xffe68823),
                ],
                barWidth: 2,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradientFrom: const Offset(0, 0),
                  gradientTo: const Offset(0, 1),
                  colors: [
                    const Color(0xffe68823).withOpacity(0.1),
                    const Color(0xffe68823).withOpacity(0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
