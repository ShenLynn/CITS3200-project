import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Page that will contain all app forms

// class EmailPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[900],
//           title: Text("Email your Clinician"),
//           centerTitle: true,
//         ),
//         body:Text("Type out what you need to email your clinician")
//     );
//   }
// }

class EmailPage extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<EmailPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  //print(myController.text);
  Future<void> send() async {
    var now = new DateTime.now();
    DateFormat formatter = DateFormat('dd-MM-yy');
    final String formatted = formatter.format(now);
    String subject = formatted + (" - New event.");

    String closer = ' --- Sent from my asthma app';

    final db = FirebaseFirestore.instance;
    var pInfo = db.collection("PersonalInfo").doc("CTFs6oAxaLKRTJMmWPvM");
    String clinEmail;
    pInfo.get().then((doc) async {
      if (doc.exists) {
        clinEmail = await doc.data()["ClinicianEmail"];
      }
      String finalBody = myController.text + closer;
      final Email email = Email(
        body: finalBody,
        subject: subject,
        recipients: [clinEmail],
        cc: [],
        bcc: [],
        attachmentPaths: [],
        isHTML: true,
      );
      print(closer);
      String platformResponse;
      try {
        await FlutterEmailSender.send(email);
        print("email sent!!");
        platformResponse = 'success';
      } catch (error) {
        platformResponse = error.toString();
        print(platformResponse);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Email your Clinician"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: send,
            icon: Icon(Icons.local_post_office),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: Text(
                  "Type out what you need to email your clinician, then press the Email button!",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: TextField(
                  controller: myController,
                ),
              )
            ]
        ),
      ),
    );
  }
}

