import 'package:asthma_app/pages/SubmittedForm1.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class MyForms extends StatefulWidget {
  @override
  _MyFormsState createState() => _MyFormsState();
}

class _MyFormsState extends State<MyForms>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyForms'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.blur_circular, color: Colors.blue[900]),
              title: Text('Mini Asthma Quality Life Questionnaire',
                  style: TextStyle(fontSize: 20.0)
              ),
              onTap: () => {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>SubmittedForm1()))
              },
            )
          ],
        ),
      ),
    );
  }
}

