import 'dart:convert';
import 'package:asthma_app/forms/addEvent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';



// Initialising DB stuff
DocumentSnapshot snapshot;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;

//Notificaiton tutorial from Sujan Bhattarai. All credit for code setup. https://www.youtube.com/watch?v=7aHSNL2lxYk
//Calendar tutorial from React Bits. All credit for basic code setup. https://www.youtube.com/watch?v=AR-9ArLSiNY


// Initialising notifications
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
AndroidInitializationSettings androidInitializationSettings;
IOSInitializationSettings iosInitializationSettings;
InitializationSettings initializationSettings;



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
  bool dataLoaded = false;
  bool notified = false;
  DateTime notifiedDate = DateTime.parse("1900-09-27 16:04:32.238370");
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;

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
            //setting up for display of notifications
            var today = DateTime.now();
            //Prevent being spammed with notifications
            if(notifiedDate.day != today.day){
              notified = false;
            }
            if(parsedDate.day == today.day && notified == false){
              _showNotification();
              notified = true;
              notifiedDate = today;
            }
          });
        });
      });
    });
  }
  //initializing notifications
  void initializing() async {
    androidInitializationSettings = AndroidInitializationSettings("app_icon");
    iosInitializationSettings = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(androidInitializationSettings, iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  }

  @override
  void initState() {
    //TODO implement calendar initstate if required
    super.initState();
    _eventController = TextEditingController();
    _controller = CalendarController();
    _currentDay = DateTime.now();
    _getData();
    initializing();
    //_showNotification();

  }

  //setting up scheduled notifications
  void _showNotification() async {
    await notification();
  }
  Future<void> notification() async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "Channel_ID",
        "channel title",
        "channel body",
        priority: Priority.High,
        importance: Importance.Max,
        ticker: "test");

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(0, "Upcoming Event!", "You have an event scheduled for today!", notificationDetails);
  }
  Future onSelectNotification(String payLoad){
    if(payLoad != null){
      print(payLoad);
    }

    //set navigator to nagitate to another screen
    initializationSettingsAndroid = new AndroidInitializationSettings('app_icon');
    initializationSettingsIOS = new IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = new InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
  }

  /**Future onSelectNotification (String payload) async {
    if(payload != null){
      print("Notification payload: $payload");
    }
  } **/

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content:  Text(body),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("Ok"),
          )
        ],
      )
    );

  }
  /**Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            print("");
          },
          child: Text("Ok"),)
      ],
    );
  } **/




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
            SizedBox(height:20),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Events", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline
              ),),SizedBox(width: 20),Icon(Icons.arrow_circle_down_sharp, size: 30,)],
            ),
            SizedBox(height:15),

            ... _selectedEvents.map((event) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Icon(Icons.event, color: Colors.blue[900],),
          title: Text(
          event,
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
          letterSpacing: 1.25
          )
          ),
          ),
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
                  //Navigator.pushNamed(context, 'calendar');
                  null;
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
