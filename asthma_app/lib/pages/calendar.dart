import 'package:flutter/material.dart';

//Calendar functions as both a calendar and the default home screen

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.blue[900],
            child: Row(
              //different rows allow for diff. layout of icon within the parent row.
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton.icon(
                          color:Colors.blue[900],
                          icon: Icon(
                          Icons.person,
                          size:35,
                          color:Colors.white),
                          onPressed: () {
                          Navigator.pushNamed(context, 'profile');
                          },
                        label: Text("")
                      )]),
                Spacer(),
                //Spacer(),//Used to ensure correct spacing of notification row below:
                Text("Asthma App  (Alpha)",
                style: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.5
                )
                ),
                Spacer(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        FlatButton.icon(
                          color:Colors.blue[900],
                            icon: Icon(
                            Icons.notifications,
                            size: 30,
                            color:Colors.white),
                            onPressed: () {
                            //TODO ADD NOTIFICATION SECTION/FUNCTION
                            }, label: Text(""))
                        ]
                    )
                ]
              ,)
                  //TODO: Add in children w/notiication icon button,
                  )),
        bottomNavigationBar: BottomAppBar(
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
