import 'package:flutter/material.dart';
import 'package:asthma_app/pages/calendar.dart';
import 'package:asthma_app/pages/login.dart';
import 'package:asthma_app/pages/forms_page.dart';
import 'package:asthma_app/pages/profile.dart';
import 'package:asthma_app/pages/help.dart';
import 'package:asthma_app/pages/treatment.dart';
import 'package:table_calendar/table_calendar.dart';
void main() => runApp(MaterialApp(
  //override default route to calender
  initialRoute: 'calendar',
  // Application routes
  routes: {
    '/': (context) => Login(),
    'calendar': (context) =>Calendar(),
    'forms_page' : (context) => FormsPage(),
    'profile' : (context) => Profile(),
    'treatment' : (context) => Treatment(),
    'help' : (context) => HelpPage()
  },
));



