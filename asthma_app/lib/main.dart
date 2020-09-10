import 'package:flutter/material.dart';
import 'package:asthma_app/pages/calendar.dart';
import 'package:asthma_app/pages/login.dart';
import 'package:asthma_app/pages/forms_page.dart';
import 'package:asthma_app/pages/profile.dart';
import 'package:asthma_app/pages/help.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:asthma_app/pages/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
        //override default route to calender
        // Application routes
        routes: {
          '/': (context) => WelcomePage(),
          'calendar': (context) =>Calendar(),
          'forms_page' : (context) => FormsPage(),
          'profile' : (context) => Profile(),
          'help' : (context) => HelpPage()
        },
      ));
}



