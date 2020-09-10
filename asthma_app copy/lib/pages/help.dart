import 'package:flutter/material.dart';
// Page that will contain all app forms

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Get Help"),
          centerTitle: true,
        ),
        body:Text("This is the page for all help info eg doctor contact, asthma wa website etc")
    );
  }
}
