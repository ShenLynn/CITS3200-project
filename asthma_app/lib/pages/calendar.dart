import 'dart:convert';
import 'package:asthma_app/forms/addEvent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Initialising DB stuff
DocumentSnapshot snapshot;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;



//Calendar functions as both a calendar and the default home screen
//setting up home screen
class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDay; //Selected day
  Map<DateTime, List<dynamic>> _events = {};
  Map<DateTime, List> _visibleEvents;
  CalendarController _controller;
  TextEditingController _eventController ;
  List<dynamic> _selectedEvents =[];

  void _getData () {
    firestoreInstance.collection("events1").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        firestoreInstance
            .collection("events1")
            .document(userid)
            .collection("event")
            .getDocuments()
            .then((querySnapshot) {
          querySnapshot.documents.forEach((result) {
            List<dynamic> items = result.get("events");
            var parsedDate = DateTime.parse(result.id);
            _events[parsedDate] = items;
          });
        });
      });
    });
    print("Got here");
    print(_events);
  }


  @override
  void initState() {
    //TODO implement calendar initstate if required
    super.initState();
    _eventController = TextEditingController();
    _controller = CalendarController();
    _currentDay = DateTime.now();
    _getData();
    /**_events = {
      DateTime.parse("2020-09-07"): ["Appointment RPH", "Pickup inhaler"],
      DateTime.parse("2020-09-20"): ["See Dr Blakey", "Complete asthma claims"]
    }; **/
    /**
        _selectedEvents =_events[_currentDay] ?? [];
        _visibleEvents = _events;
        print(_selectedEvents);
        print(_events[_currentDay]);
     **/

  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          title: Text(event.toString()),
          onTap: () => print('$event tapped!'),
        ),
      ))
          .toList(),
    );
  }

  //set up global key for notification bar so we can open it w/ custom button
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState >();


  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey, // notification key set
      appBar: AppBar(
        //header of app
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
          title: Text("Asthma App"),
          centerTitle: true,
          actions: [
            IconButton(
              icon:Icon(
                  Icons.notifications,
                  color:Colors.white
              ),
              onPressed: () {
                _scaffoldkey.currentState.openEndDrawer();
                //TODO: Add function to display notifications
              },
            )
          ]),
      //notification panel work
      endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Notifications",
                    style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center
                ),
                decoration: BoxDecoration(

                  color: Colors.blue[900],
                ),
              ),
              ListTile(
                  title: Text("Notification 1"),
                  onTap: () {
                    //do something eg rubbish bin dismisses
                    Navigator.pop(context); //return back to calendar
                  }
              ),
              ListTile(
                  title: Text("Notification 2"),
                  onTap: () {
                    //do something
                    Navigator.pop(context); //return back to calendar
                  }
              ),
            ],
          )
      ),

      //body of app

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("events1")
        .doc(userid).collection("event").snapshots(),
        builder: (context, snapshots){
          if (snapshots.data == null) return CircularProgressIndicator();
          _getData();
          //num numDocs = snapshots.data.documents.length;
         // num index = 0;
         // for (index; index< numDocs+1; index++) {
          //  _events[snapshots.data.docs]
        //  }
         // DocumentSnapshot dateData = snapshots.data.docs[index];

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TableCalendar(
                events: _events,
                calendarController: _controller,
                initialCalendarFormat: CalendarFormat.month,
                headerStyle: HeaderStyle(
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color:Colors.blue[900],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    formatButtonTextStyle: TextStyle(
                        color: Colors.white
                    )
                ),
                onDaySelected: (date, events) {
                  setState(() {
                    _selectedEvents = events;
                  });
                } ,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.orange[600],
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    selectedColor: Colors.blue[900]
                ),
              ),

            ... _selectedEvents.map((event) => ListTile(
          title: Text(
          event,
          style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2
          )
          )
          ),
           /**   ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                itemCount: snapshots.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot date1 = snapshots.data.docs[index];
                  print(date1.data()['events']);
                  return ListTile(
                      leading: Text(date1.data()['events'].toString()));
                }
                ), **/
            )]
          )
        );
        }),
              /**... _selectedEvents.map((event) => ListTile(
                title: Text(
                  event,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),),)), **/


      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue[900],
          onPressed: () {
            //_displayDialog,
            Navigator.pushNamed(context, 'addEvent');
          }
      ),



      // footer of app
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

  _displayDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add an event", textAlign: TextAlign.center,),
            content: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Enter an event",
                alignLabelWithHint: false,
                border: UnderlineInputBorder(),
              ),
              controller: _eventController,
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.blue[900],
                onPressed: (){
                  //if empty do nothing
                  if(_eventController.text.isEmpty) return;
                  //if events on date already, add to array
                  setState(() {
                    if(_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay].add(_eventController.text);
                      print("Tried to insert");
                      print(_events[_controller.selectedDay]);
                      //if no events on date, create new event.
                    } else {
                      _events[_controller.selectedDay] = [_eventController.text];
                    }
                    _eventController.clear();
                    //exit out of dialogue
                    Navigator.pop(context);
                  });
                },
                child: Text("Add Event"),
              )
            ],
          );
        }
    );
  }
}

/**void _getData () {
  firestoreInstance.collection("events1").getDocuments().then((querySnapshot) {
    querySnapshot.documents.forEach((result) {
      firestoreInstance
      .collection("events1")
          .document(userid)
          .collection("event")
          .getDocuments()
          .then((querySnapshot) {
            querySnapshot.documents.forEach((result) {
              List<String> items = result.get("events");
              _events[result.id] = items;
            });
      });
    });
  });
} **/