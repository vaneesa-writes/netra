import 'package:flutter/material.dart';

import '../utils/parsingJson.dart';

Color totalAttenadnceColor(double atte) {
  if (atte > 75)
    return Color(0xFF6effb0);
  else if (atte > 60)
    return Colors.orangeAccent;
  else
    return Color(0xFFff6b66);
}

class displayAttendance extends StatelessWidget {
  const displayAttendance({
    Key key,
    @required this.result,
  }) : super(key: key);

  final getAttendance result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40.0),
      height: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          Text(
            "Your Total attendance percentage is ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: Color(0xFFffd657),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Text(
              result.overallattperformance.totalpercentage,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: totalAttenadnceColor(double.parse(
                      result.overallattperformance.totalpercentage))),
            ),
          )
        ],
      ),
    );
  }
}
