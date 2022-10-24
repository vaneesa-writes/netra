import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile_image extends StatelessWidget {
  const profile_image({
    Key key,
    this.roolNumber,
  }) : super(key: key);

  final String roolNumber;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 65,
        backgroundColor: Colors.teal,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'http://teleuniv.in/sanjaya/student-images/' +
                  roolNumber +
                  '.jpg'),
          radius: 60,
        ),
      ),
    );
  }
}
