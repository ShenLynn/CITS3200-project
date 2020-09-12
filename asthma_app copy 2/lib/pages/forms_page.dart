import 'package:asthma_app/Patient_forms/form1.dart';
import 'package:flutter/material.dart';
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
            SizedBox(width: 10.0, height: 10.0),
            Text('Click one of the items below to record an event',
                style: TextStyle(fontWeight: FontWeight.bold,height: null, fontSize: 16,
                color: Colors.redAccent)),
            SizedBox(width: 10.0, height: 10.0),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.blue[900]),
              title: Text('Mini Asthma Quality Life Questionnaire',
                  style: TextStyle(fontSize: 20.0)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>form1()));
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.blue[900]),
              title: Text('Record Asthma Attack',
                  style: TextStyle(fontSize: 20.0)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>form1()));
              },
            )
          ],
        )
    );
  }
}
