import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';




//Tutorial from Sujan Bhattarai. All credit goes to this creator for any code. https://www.youtube.com/watch?v=7aHSNL2lxYk

class LocalNotifications extends StatefulWidget {
  @override
  _LocalNotificationsState createState() => _LocalNotificationsState();
}

class _LocalNotificationsState extends State<LocalNotifications> {


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;


  @override
  void initState() {
    super.initState();
    initializing();
  }

  void initializing() async {
    androidInitializationSettings = AndroidInitializationSettings("app_icon");
    iosInitializationSettings = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(androidInitializationSettings, iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  }

  void _showNotifications() async {
    await notification();
  }

  void _showNotificationsAfterSecond() async {
    await notificationAfterSecond();
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
    await flutterLocalNotificationsPlugin.show(0, "Hello there", "This is a body", notificationDetails);
  }
  Future<void> notificationAfterSecond() async {
    var timeDelayed = DateTime.now().add(Duration(seconds: 5));
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "Second Channel",
        "channel title",
        "channel body",
        priority: Priority.High,
        importance: Importance.Max,
        ticker: "test");

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(0, "Hello there", "This is a body", timeDelayed ,notificationDetails);
  }

  Future onSelectNotification(String payLoad){
    if(payLoad != null){
      print(payLoad);
    }

    //set navigator to nagitate to another screen

  }
  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
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
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.blue[900],
              onPressed: _showNotifications,
              child: Text("Show notification", style: TextStyle(fontSize: 20.0, color: Colors.white),),),
            FlatButton(
              color: Colors.blue[900],
              onPressed: _showNotificationsAfterSecond,
              child: Text("Show notification after few seconds", style: TextStyle(fontSize: 20.0, color: Colors.white),),)

          ],
        ),
      )

    );
  }
}