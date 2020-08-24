import 'package:flutter/material.dart';
import 'package:group25_cits3200_asthma_app/pages/calender.dart';
void main() => runApp(MaterialApp(
  home: Calender(),
  initialRoute: '/',
  // Application routes
  routes: {
    '/': (context) => Login(),
    '/calender': (context) =>Calender(),
    '/forms_page' : (context) => FormsPage(),
    'profile' : (context) => Profile(),
  },

)); //MaterialApp



