import 'package:asthma_app/forms/form1.dart';
import 'package:asthma_app/forms/form2.dart';
import 'package:asthma_app/forms/form3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Page that will contain all app forms
class FormsPage extends StatefulWidget {
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Events"),
          centerTitle: true,
        ),
        body:Column(
          children: [
            SizedBox(width: 10.0, height: 20.0),
            Text('Click one of the items below to record an event',
                style: TextStyle(fontWeight: FontWeight.bold,height: null, fontSize: 18,
                    color: Colors.grey, decoration: TextDecoration.underline)),
            SizedBox(width: 10.0, height: 40.0),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.blue[900]),
              title: Text('Mini Asthma Quality Life Questionnaire',
                  style: TextStyle(fontSize: 20.0)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>form1()));
              },
            ),
            SizedBox(width: 10.0, height: 10.0),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.blue[900]),
              title: Text('Questionnaire on cough impact on your life',
                  style: TextStyle(fontSize: 20.0)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>form2()));
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.blue[900]),
              title: Text('Record Asthma Attack',
                  style: TextStyle(fontSize: 20.0)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>form3()));
              },
            )
          ],
        )
    );
  }
}

