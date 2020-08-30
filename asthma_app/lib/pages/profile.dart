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
        backgroundColor: Colors.blue[900],
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
                height: 160.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue[800], Colors.green]
                  )
                ),
                child:Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                        bottom: -60.0,
                      child:CircleAvatar(
                        radius: 90.0,
                        backgroundColor: Colors.white,
                      )
                    ),
                    Positioned(
                      bottom: -50.0,
                      child: Center(
                        child:CircleAvatar(
                          backgroundImage: AssetImage('assets/joebloggs.jpeg'),
                          radius: 80.0,
                          backgroundColor: Colors.white ,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),

                  ]
                )

              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                SizedBox(height: 25.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Joe Bloggs',
                      style: TextStyle( color: Colors.black,fontSize: 35.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
              Text(
                  'Full Name:',
                  style: TextStyle(color: Colors.blue[800],fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
              ),

              Text(
                'Joe Alexander Bloggs',
                    style: TextStyle(fontSize: 25.0)
              ),
              SizedBox(height: 20.0),
              Text(
                  'Date Of Birth:',
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
              ),

              Text(
                  '10/07/1999',
                  style: TextStyle(fontSize: 25.0)
              ),
              SizedBox(height: 20.0),
              Text(
                  'Phone Number:',
                  style: TextStyle(color: Colors.blue[800],fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
              ),

              Text(
                  '0428298371',
                  style: TextStyle(fontSize: 25.0)
              ),
              SizedBox(height: 20.0),
              Text(
                  'Email Address:',
                  style: TextStyle(color: Colors.blue[800],fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
              ),

              Text(
                  'Joebloggs13@gmail.com',
                  style: TextStyle(fontSize: 25.0)
              ),
              SizedBox(height: 20.0),
              Text(
                'About Me:',
                style: TextStyle(color: Colors.blue[800],fontSize: 20.0, letterSpacing: 2.0,fontWeight: FontWeight.bold )
              ),

              Text(
                'I have been living with asthma for 10 years now. The first time I got an asthma attack I was around 11 years old, I was swimming in a lake with some friends when I felt this tightness in my chest. ',
                style: TextStyle(fontSize: 20.0)
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
                style: TextStyle(color: Colors.blue[800], fontSize: 25),
              ),
            ),

    ),
            ListTile(
              leading: Icon(Icons.blur_circular, color: Colors.blue[800]),
              title: Text('Diagnosis'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in, color: Colors.blue[800]),
              title: Text('Control'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.airline_seat_flat, color: Colors.blue[800]),
              title: Text('Treatment'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.child_care, color: Colors.blue[800]),
              title: Text('Related problems'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.contacts, color: Colors.blue[800]),
              title: Text('Contact details'),
              onTap: () => {},
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue[800]),
              title: Text('Settings'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new, color: Colors.blue[800]),
              title: Text('Log out'),
              onTap: () => {},
            ),
        ]
      )
    );
  }
}
