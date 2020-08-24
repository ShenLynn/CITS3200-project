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
        body: SafeArea(child: Text("Calender Screen/home"))
    );
  }
}
