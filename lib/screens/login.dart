import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/validateStudent.dart';
import 'home.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String errorMsg = "";
  var userNameTemp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: Color(0xFF5CB9F2),
        title: Text(
          "Bunk it!",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/login.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userNameTemp,
                decoration: InputDecoration(
                  hintText: 'Roll Number',
                  hintStyle: TextStyle(fontSize: 25.0),
                  suffixIcon: Icon(
                    Icons.login,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xFFD9B777)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  String netraId =
                      validateStudent(roll: userNameTemp.text.trim())
                          .getNetraID();
                  if (netraId != null) {
                    if (netraId == "Roll Number not found") {
                      setState(() {
                        errorMsg = netraId;
                      });
                    } else {
                      netraIDGlobal = netraId;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => home(
                                  netraId: netraId,
                                  rollNumber:
                                      userNameTemp.text.trim().toUpperCase(),
                                )),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black87,
                  primary: Colors.grey[300],
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                child: Text('Check Attendance'),
              ),
              Container(
                child: Text(
                  errorMsg,
                  style: TextStyle(color: Colors.redAccent, fontSize: 25.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
