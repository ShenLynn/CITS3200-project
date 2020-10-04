import 'package:flutter/material.dart';
import 'package:asthma_app/pages/calendar.dart';
import 'package:asthma_app/pages/login.dart';
import 'package:asthma_app/pages/forms_page.dart';
import 'package:asthma_app/pages/profile.dart';
import 'package:asthma_app/pages/help.dart';
import 'package:asthma_app/pages/welcome.dart';
import 'package:asthma_app/forms/addEvent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/notification.dart';

void main ()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blue[900]
    ),
    //override default route to calender
    // Application routes
    //initialRoute: "notification",
    routes: {
      '/': (context) => WelcomePage(),
      'calendar': (context) => Calendar(),
      'forms_page': (context) => FormsPage(),
      'profile': (context) => Profile(),
      'help': (context) => HelpPage(),
      'addEvent': (context) => addEvent(),
      'notification': (context) => LocalNotifications()
    },
  ));
}



