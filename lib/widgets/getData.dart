import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:netra/constants.dart';
import 'package:netra/utils/parsingJson.dart';

Future<getAttendance> askData() async {
  log("here");
  final response = await http.post(
    Uri.parse('http://teleuniv.in/netra/api.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "method": "314",
      "rollno": int.parse(netraIDGlobal),
    }),
  );

  if (response.statusCode == 200) {
    log("here_end");
    getAttendance attendanceObject =
        getAttendance.fromJson(jsonDecode(response.body));
    chartData = [];
    getChartData(attendanceObject);
    log(chartData.length.toString());
    return attendanceObject;
  } else {
    log('Request failed with status: ${response.statusCode}.');
    throw Exception('Failed to fetch');
  }
}

void getChartData(getAttendance attObject) {
  for (var item in attObject.overallattperformance.overall) {
    log(item.subjectname);
    try {
      chartData
          .add(subjectData(item.subjectname, double.parse(item.percentage)));
    } catch (eroor) {
      log(eroor.toString());
    }
  }
}
