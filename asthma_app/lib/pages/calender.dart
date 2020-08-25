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
          child: Container(
            color: Colors.green,
            child: Row(
              //different rows allow for diff allignment of icon within the parent row.
              children: [Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                  color:Colors.green,
                   icon: Icon(
                    Icons.person,
                    color:Colors.white),
                    onPressed: () {
                    Navigator.pushNamed(context, 'profile');
                    },
                      label: Text("")
                      )],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  //TODO: Add in children w/notiication icon button,
              )],
            )
          )
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, 'profile');
              },
              icon: Icon(
                  Icons.person, color:Colors.white),
              label: Text(
                  "Navigate to user",
              style:TextStyle(
                color:Colors.white)),
            ),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, 'forms_page');
              },
              icon: Icon(Icons.insert_drive_file, color: Colors.white),
              label: Text(
                "Navigate to forms",
              style:TextStyle(color: Colors.white)),
            )
          ],
        )
      ),
    );
  }
}
