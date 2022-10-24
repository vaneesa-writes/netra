import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netra/utils/parsingJson.dart';
import 'package:netra/widgets/displayAttendance.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constants.dart';
import '../widgets/getData.dart';
import '../widgets/profileImage.dart';

class home extends StatefulWidget {
  String netraId, rollNumber;

  home({Key key, String this.netraId, String this.rollNumber})
      : super(key: key);

  @override
  State<home> createState() => _homeState();
}

String totalPerformance = "";

class _homeState extends State<home> {
  getResult() async {
    final getAttendance userID = await askData();
  }

  TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: askData(),
        builder: (BuildContext context, AsyncSnapshot<getAttendance> snapshot) {
          if (!snapshot.hasData)
            return Container(
              child: SpinKitSpinningLines(color: Colors.white),
            );
          final getAttendance result = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF5CB9F2),
              title: Text(
                "Bunk it!",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: profile_image(
                      roolNumber: widget.rollNumber,
                    ),
                  ),
                ),
                Expanded(child: displayAttendance(result: result)),
                Expanded(
                  child: Visibility(
                    visible: true,
                    child: SfCircularChart(
                      title: ChartTitle(text: '(Subject Wise Attendance)'),
                      legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                        PieSeries<subjectData, String>(
                          dataSource: chartData,
                          xValueMapper: (subjectData data, _) => data.subject,
                          yValueMapper: (subjectData data, _) =>
                              data.percentage,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          enableTooltip: true,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
