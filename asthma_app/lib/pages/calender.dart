import 'package:flutter/material.dart';

//Calender functions as both a calender and the default home screen

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Row(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, 'profile');
                },
                icon: Icon(Icons.person),
                label: Text("Navigate to user"),
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, 'forms_page');
                },
                icon: Icon(Icons.insert_drive_file),
                label: Text("Navigate to forms"),
              )
            ],
          )
        ),
    );
  }
}
