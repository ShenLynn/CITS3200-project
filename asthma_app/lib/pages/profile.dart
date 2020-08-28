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
        body: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 180.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lightGreen, Colors.green]
                  )
                ),
                child:Column(
                  children: <Widget>[
                    SizedBox(height:20.0),
                    Center(
                      child:CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white ,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Joe Bloggs',
                        style: TextStyle( color: Colors.white,fontSize: 35.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]
                )

              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
              Text(
                  'Full Name',
                  style: TextStyle(color: Colors.blueGrey,fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10.0),
              Text(
                'Joe Alexander Bloggs',
                    style: TextStyle(fontSize: 25.0, letterSpacing: 2.0)
              ),
              SizedBox(height: 10.0),
              Text(
                  'Date Of Birth',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10.0),
              Text(
                  '10/07/1999',
                  style: TextStyle(fontSize: 25.0, letterSpacing: 2.0)
              ),
              SizedBox(height: 10.0),
              Text(
                  'Phone Number',
                  style: TextStyle(color: Colors.blueGrey,fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10.0),
              Text(
                  '0428298371',
                  style: TextStyle(fontSize: 25.0, letterSpacing: 2.0)
              ),
              SizedBox(height: 10.0),
              Text(
                  'Email Address',
                  style: TextStyle(color: Colors.blueGrey,fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5.0),
              Text(
                  'Joebloggs13@gmail.com',
                  style: TextStyle(fontSize: 25.0, letterSpacing: 2.0)
              ),
              SizedBox(height: 10.0),
              Text(
                'About Me',
                style: TextStyle(color: Colors.blueGrey,fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold )
              ),
              SizedBox(height: 5.0),
              Text(
                'I have been living with asthma for 10 years now. The first time I got an asthma attack I was around 11 years old, I was swimming in a lake with some friends when I felt this tightness in my chest. ',
                style: TextStyle(fontSize: 20.0, letterSpacing: 2.0)
              ),

              SizedBox(height: 20.0),]

              )
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
            child: Center(
              child: Text(
                'My Asthma Profile',
                style: TextStyle(color: Colors.green, fontSize: 25),
              ),
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
            SizedBox(height: 30.0),
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
