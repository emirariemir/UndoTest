import 'package:flutter/material.dart';
import 'package:undo_test/components/top_config_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:undo_test/constants.dart';

class StaticsPage extends StatelessWidget {
  const StaticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
            top: 10.0, left: 24.0, right: 24.0, bottom: 0.0),
        child: Column(
          children: [
            CustomTopBar(
              onAddIconTap: () {},
              header: 'STATICS',
              addIconMood: false,
              bigTitle: 'Progress',
              smallTitle: 'All your progress in one page.',
              icon: Icons.wb_sunny,
              onIconTap: () {
                print('test statics');
              },
            ),
            Expanded(
              child: PieChart(
                PieChartData(
                  sectionsSpace: 15,
                  sections: [
                    PieChartSectionData(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 5.0),
                      value: 15,
                      color: kmyBlueColor,
                      radius: 60,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 5.0),
                      value: 6,
                      color: kMyRedColor,
                      radius: 60,
                      showTitle: false,
                    ),
                  ],
                  centerSpaceRadius: double.infinity,
                ),
                swapAnimationDuration: Duration(milliseconds: 160),
                swapAnimationCurve: Curves.easeIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
