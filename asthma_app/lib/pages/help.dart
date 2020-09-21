import 'package:flutter/material.dart';
import 'package:asthma_app/pages/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Assistance extends StatefulWidget {
  @override
  _AssistanceState createState() => _AssistanceState();
}

class _AssistanceState extends State<Assistance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            //Navigator to calendar
            Navigator.pushNamed(context, 'calendar');
          },
        ),
        backgroundColor: Colors.blue[900],
        title: Text(
          "Assistance Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                //Navigator
                Navigator.pushNamed(context, 'emailPage');
                print("send email touch touch");
              },
              child: Container(
                height: 120.0,
                margin: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(
                      new Radius.circular(10.0)
                  ),
                  color: Colors.blue[900],
                ),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                      child: new Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 64.0,
                      ),
                    ),
                    new Expanded(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: new Text(
                              'Contact Clinician',
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120.0,
              margin: new EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(
                    new Radius.circular(10.0)
                ),
                color: Colors.blue[900],
              ),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new Icon(
                      Icons.note_add,
                      color: Colors.white,
                      size: 64.0,
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: new Text(
                            'Record New Event',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                //Navigator
                Navigator.pushNamed(context, 'help');
                print("app touch");
              },
              child: Container(
                height: 120.0,
                margin: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(
                      new Radius.circular(10.0)
                  ),
                  color: Colors.blue[900],
                ),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                      child: new Icon(
                        Icons.help,
                        size: 64.0,
                        color: Colors.white,
                      ),
                    ),
                    new Expanded(child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: new Text(
                            'App help',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
