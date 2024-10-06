import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

import '../../../../../core/functions/dashboard_data.dart';

class Activity extends StatelessWidget {
  const Activity({
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
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Your Activity'),
                // Enable legend
                legend: Legend(
                  isVisible: true,
                ),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries<ActivityData, String>>[
                  LineSeries<ActivityData, String>(
                      color: Colors.teal,
                      markerSettings: const MarkerSettings(
                          color: Colors.cyan,
                          width: 0,
                          height: 0,
                          isVisible: true),
                      dataSource: activityList,
                      xValueMapper: (ActivityData sales, _) => sales.year,
                      yValueMapper: (ActivityData sales, _) => sales.sales,
                      name: 'Active',
                      // Enable data label
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true))
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
