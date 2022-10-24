import 'package:flutter/material.dart';
import 'package:netra/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    child:
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // Themes
      darkTheme: ThemeData.dark(),
      // home: home(
      //   netraId: '2420207',
      //   rollNumber: '20BD1A6625',
      // ),
      home: loginPage(),
      routes: {
        'login': (context) => loginPage(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity(horizontal: 2.0, vertical: 2.0),
        primaryColorLight: Color(0xff03203C),
        primaryColorDark: Color(0xff242B2E),

        // Icon Theme
        iconTheme: IconThemeData(color: Colors.amber, size: 15.0, opacity: 10),
      ),
    );
  }
}
