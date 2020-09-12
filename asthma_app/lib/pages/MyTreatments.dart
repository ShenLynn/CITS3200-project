import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyTreatments extends StatefulWidget {
  @override
  _MyTreatmentsState createState() => _MyTreatmentsState();
}

class _MyTreatmentsState extends State<MyTreatments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Treatment'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          initialChildSize: 1.0,
          minChildSize: 0,
          maxChildSize: 1.0,
          builder: (BuildContext context, ScrollController scrollController){
            return Container(
                color: Colors.blue[100],
                child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                          child: ListTile(
                              onTap: () {},
                              title: Text(
                                'HELLO',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              subtitle: Text(
                                'HELLO',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 0.5,
                                ),
                              )
                          )
                      );
                    }
                )
            );
          },
        ),
      ),
    );
  }
}
