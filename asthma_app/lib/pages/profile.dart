import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:SideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("User Profile"),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.person),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child:CircleAvatar(
                  radius: 40.0,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                   'Joe Bloggs',
                    style: TextStyle(fontSize: 30.0),
                 ),
              ),
              SizedBox(height: 20.0),
              Text(
                'About Me',
                style: TextStyle(fontSize: 25.0, letterSpacing: 2.0, fontWeight: FontWeight.bold )
              ),
              SizedBox(height: 5.0),
              Text(
                'My name is Joe and I have been living with asthma for 10 years now. The first time I got an asthma attack I was around 11 years old, I was swimming in a lake with some friends when I felt this tightness in my chest. ',
                style: TextStyle(fontSize: 20.0, letterSpacing: 2.0)
              ),

              SizedBox(height: 20.0),
              Text(
                  'Diagnosis',
                  style: TextStyle(fontSize: 25.0, letterSpacing: 2.0, fontWeight: FontWeight.bold )
              ),
              SizedBox(height: 5.0),
              Text(
                  '',
                  style: TextStyle(fontSize: 20.0, letterSpacing: 2.0)
              )

            ]
          )
        )
        );

  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'My Asthma Profile',
              style: TextStyle(color: Colors.grey, fontSize: 25),
            ),

    ),
            ListTile(
              leading: Icon(Icons.blur_circular),
              title: Text('Diagnosis'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text('Control'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.airline_seat_flat),
              title: Text('Treatment'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.child_care),
              title: Text('Related problems'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact details'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Log out'),
              onTap: () => {},
            ),
        ]
      )
    );
  }
}
