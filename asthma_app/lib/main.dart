import 'package:flutter/material.dart';
import 'package:asthma_app/pages/calendar.dart';
import 'package:asthma_app/pages/login.dart';
import 'package:asthma_app/pages/forms_page.dart';
import 'package:asthma_app/pages/profile.dart';
import 'package:asthma_app/pages/help.dart';
import 'package:asthma_app/pages/welcome.dart';
import 'package:asthma_app/forms/addEvent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:asthma_app/help/EmailPage.dart';

void main ()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    //override default route to calender
    // Application routes
    //initialRoute: "calendar",
    routes: {
      '/': (context) => WelcomePage(),
      'calendar': (context) => Calendar(),
      'forms_page': (context) => FormsPage(),
      'profile': (context) => Profile(),
      'help': (context) => Assistance(),
      'addEvent': (context) => addEvent(),
      'emailPage': (context) => EmailPage(),
    },
  ));
}



