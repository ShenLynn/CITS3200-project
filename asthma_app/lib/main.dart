import 'package:flutter/material.dart';
import 'package:asthma_app/pages/calender.dart';
import 'package:asthma_app/pages/login.dart';
import 'package:asthma_app/pages/forms_page.dart';
import 'package:asthma_app/pages/profile.dart';
void main() => runApp(MaterialApp(
  //override default route to calender
  initialRoute: 'calender',
  // Application routes
  routes: {
    '/': (context) => Login(),
    'calender': (context) =>Calender(),
    'forms_page' : (context) => FormsPage(),
    'profile' : (context) => Profile(),
  },
));



