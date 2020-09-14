import 'package:flutter/material.dart';
import 'package:asthma_app/pages/calendar.dart';
import 'package:asthma_app/pages/login.dart';
import 'package:asthma_app/pages/forms_page.dart';
import 'package:asthma_app/pages/profilefiles/profile.dart';
import 'package:asthma_app/pages/help.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:asthma_app/pages/welcome.dart';
void main() => runApp(MaterialApp(
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



