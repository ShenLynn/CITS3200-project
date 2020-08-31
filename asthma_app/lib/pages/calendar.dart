import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//Calendar functions as both a calendar and the default home screen

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'treatment');
          },
        ),
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon:Icon(
            Icons.person,
            color:Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'profile');
          },
        ),
        title: Text("Asthma App Alpha"),
        centerTitle: true,
        actions: [
          IconButton(
            icon:Icon(
                Icons.notifications,
                color:Colors.white
            ),
            onPressed: () {

            },
          )
        ]),
    bottomNavigationBar: BottomAppBar(
    elevation: 0,
    color: Colors.blue[900],
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    FlatButton.icon(
    onPressed: () {
    Navigator.pushNamed(context, 'forms_page');
    },
    icon: Icon(Icons.insert_drive_file, color: Colors.white),
    label: Text(
    "Forms",
    style:TextStyle(color: Colors.white)),
    ),
    FlatButton.icon(
    onPressed: () {
    Navigator.pushNamed(context, 'calendar');
    },
    icon: Icon(Icons.calendar_today, color: Colors.white),
    label: Text(
    "Calendar",
    style:TextStyle(color: Colors.white)),
    ),
    FlatButton.icon(
    onPressed: () {
    Navigator.pushNamed(context, 'help');
    },
    icon: Icon(
    Icons.help, color:Colors.white),
    label: Text(
    "Help",
    style:TextStyle(
    color:Colors.white)),
    ),
    ],
    )
    ),
    );
  }
}
