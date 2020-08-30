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
        title: Text("Forms"),
        centerTitle: true,
      ),
        body:Text("This is the page for all forms")
    );
  }
}
