import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:asthma_app/pages/services/database.dart';
import 'package:asthma_app/models/user.dart';
import 'package:asthma_app/pages/profile.dart';

final nameController = TextEditingController();
final dobController = TextEditingController();
final phonenumberController = TextEditingController();
final aboutmeController = TextEditingController();

class Profile_edit extends StatefulWidget {
  @override
  _Profile_editState createState() => _Profile_editState();
}


class _Profile_editState extends State<Profile_edit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserData>.value(
      value: DatabaseService().personalInfo,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text("User Profile"),
            centerTitle: true,
          ),
          body: ProfileTemplate(),

      ),
    );
  }
}

class ProfileTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final info = Provider.of<UserData>(context);
    if(info == null) return CircularProgressIndicator();
    return SingleChildScrollView(
        child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.center,
                          child: TextField(
                            controller: nameController..text = info.fullname,
                            style: TextStyle( color: Colors.black,fontSize: 30.0),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        Divider(
                          color: Colors.grey,
                          height: 10.0,
                        ),
                        Text(
                            'Date Of Birth:',
                            style: TextStyle(color: Colors.blue[900], fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
                        ),
                        TextField(
                          controller: dobController..text = info.dob,
                          style: TextStyle( color: Colors.black,fontSize: 30.0),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                            'Phone Number:',
                            style: TextStyle(color: Colors.blue[900],fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)
                        ),
                        TextField(
                          controller: phonenumberController..text = info.phonenumber,
                          style: TextStyle( color: Colors.black,fontSize: 30.0),
                        ),
                        SizedBox(height: 5.0),

                        Text(
                            'About Me:',
                            style: TextStyle(color: Colors.blue[900],fontSize: 25.0, letterSpacing: 2.0,fontWeight: FontWeight.bold )
                        ),
                        TextField(
                          controller: aboutmeController..text = info.aboutme,
                          style: TextStyle( color: Colors.black,fontSize: 30.0),
                        ),
                        SizedBox(height: 20.0),
                    RaisedButton(
                      child: Text("Update profile"),
                      onPressed:(){
                        DatabaseService().updateUserProfile(nameController.text, dobController.text, phonenumberController.text, aboutmeController.text );
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                      },
                    )
        ]
                  )
              )
            ]
        )
    );
  }
}
