import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

import '../../../../../core/functions/dashboard_data.dart';

class Great extends StatelessWidget {
  const Great({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GlassBox(
        widget: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SfCircularChart(
                title: ChartTitle(text: 'Great !'),
                legend: Legend(
                    isVisible: true, padding: 5, itemPadding: 3, height: '120'),
                backgroundColor: Colors.transparent,
                borderColor: Colors.transparent,
                palette: [
                  Colors.green[300]!,
                  Colors.deepPurple[300]!,
                  Colors.red[300]!,
                  Colors.cyan[300]!,
                ],
                tooltipBehavior: TooltipBehavior(
                  color: Colors.blue,
                ),
                margin: EdgeInsets.zero,
                series: <RadialBarSeries<GreatData, String>>[
                  RadialBarSeries<GreatData, String>(
                      gap: '2',
                      radius: '50',
                      name: '5',
                      innerRadius: '15',
                      cornerStyle: CornerStyle.bothCurve,
                      opacity: 1,
                      useSeriesColor: false,
                      trackColor: Colors.blueGrey,
                      trackBorderColor: Colors.transparent,
                      trackOpacity: .1,
                      strokeColor: Colors.transparent,
                      maximumValue: 100,
                      trackBorderWidth: 3,
                      strokeWidth: 3,
                      enableTooltip: true,
                      sortingOrder: SortingOrder.ascending,
                      dataSource: greatDataList,
                      xValueMapper: (GreatData data, _) => data.xData,
                      yValueMapper: (GreatData data, _) => data.yData,
                      dataLabelMapper: (GreatData data, _) => data.text,
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: false, color: Colors.teal, opacity: .3)),
                ]),
          ),
        ),
        color: Colors.white.withOpacity(.2),
        borderRadius: 20,
        x: 0,
        y: 0,
        border: true,
      ),
    );
  }
}
