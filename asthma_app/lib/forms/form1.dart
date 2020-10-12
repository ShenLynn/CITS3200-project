import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

var q1answer,q2answer,q3answer,q4answer,q5answer,q6answer,q7answer,q8answer,q9answer,
    q10answer,q11answer,q12answer,q13answer,q14answer,q15answer;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;
final userName = user.displayName;
List<String> _answers1 = ['1', '2', '3', '4', '5', '6', '7'];

class form1 extends StatefulWidget {
  @override
  _form1State createState() => _form1State();
}

class _form1State extends State<form1> {
  final databaseReference = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Asthma Quality Life Questionnaire'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Please complete all the questions by selecting the number that best describes how you have been during the last 2 weeks as a result of your asthma',
                  style: TextStyle(fontWeight :FontWeight.bold,color: Colors.red),
                  ),
                  SizedBox(height: 15,),
                  Text('1. Feel SHORT OF BREATH as a result of your asthma?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q1answer,
                    onChanged: (newValue){
                      setState(() {q1answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('2. Feel bothered by or have to avoid DUST in the environment?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q2answer,
                    onChanged: (newValue){
                      setState(() {q2answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('3. Fell FRUSTRATED as a result of your asthma?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q3answer,
                    onChanged: (newValue){
                      setState(() {q3answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('4. Feel bothered by COUGHING?', style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q4answer,
                    onChanged: (newValue){
                      setState(() {q4answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('5. Feel AFRAID OF NOT HAVING YOUR ASTHMA MEDICATION AVAILABLE?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q5answer,
                    onChanged: (newValue){
                      setState(() {q5answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('6. Experience a feeling of CHEST TIGHTNESS OR CHEST HEAVINESS?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q6answer,
                    onChanged: (newValue){
                      setState(() {q6answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('7. Feel bothered by or have to avoid CIGARETTE SMOKE in the environment?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q7answer,
                    onChanged: (newValue){
                      setState(() {q7answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('8. Have DIFFICULTY GETTING A GOOD NIGHTS SLEEP as a result of your asthma?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q8answer,
                    onChanged: (newValue){
                      setState(() {q8answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 70,),
                  Text('9. Feel CONCERNED ABOUT HAVING ASTHMA?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q9answer,
                    onChanged: (newValue){
                      setState(() {q9answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 70,),
                  Text('10. Experience a WHEEZE in your chest?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q10answer,
                    onChanged: (newValue){
                      setState(() {q10answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 70,),
                  Text('11. Feel bothered by or have to avoid going outside because of WEATHER OR AIR POLLUTION?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. All of the time ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Most of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A good bit of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Some of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A little of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Hardly any of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. None of the time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q11answer,
                    onChanged: (newValue){
                      setState(() {q11answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('12. STRENUOUS ACTIVITIES(such as hurrying, exercising, running up stairs,sports)?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. Totally limited ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Extreme limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. Very limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Moderate limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. Some limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. A little limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. Not at all limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q12answer,
                    onChanged: (newValue){
                      setState(() {q12answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('13. MODERATE ACTIVITIES(such as walking,housework,gardening,shopping,climbing stairs)?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. Totally limited ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Extreme limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. Very limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Moderate limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. Some limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. A little limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. Not at all limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q13answer,
                    onChanged: (newValue){
                      setState(() {q13answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('14. SOCIAL ACTIVITIES(such as talking, playing with pets/children, visiting friends/relatives)',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. Totally limited ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Extreme limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. Very limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Moderate limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. Some limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. A little limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. Not at all limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q14answer,
                    onChanged: (newValue){
                      setState(() {q14answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text('15. WORK RELATED ACTIVITES(tasks you have to do at work)',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('1. Totally limited ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Extreme limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. Very limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Moderate limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. Some limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. A little limitation',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('7. Not at all limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: q15answer,
                    onChanged: (newValue){
                      setState(() {q15answer = newValue;
                      });
                    },
                    items:_answers1.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70,),
                  Text(checkAllAnswers(q1answer,q2answer,q3answer,q4answer,q5answer,q6answer,q7answer,q8answer,q9answer,q10answer,q11answer,q12answer,
                  q13answer,q14answer,q15answer),
                    style: TextStyle(fontWeight :FontWeight.bold, color: Colors.red),),
                  RaisedButton(child: Text('Submit Form'),
                  onPressed:(){
                    createRecord();
                    Navigator.pushNamed(context, 'forms_page');
                  },
                  )
                ],
          )
      ), //center
    )
    );
  }
}

String checkAllAnswers(var a, var b, var c, var d, var e,
                       var f, var g, var h, var i, var j,var k, var l, var m, var n, var o,){

  if(a == null || b == null || c == null || d == null || e == null ||
  f == null || g == null || h == null || i == null || j == null ||
      k == null || l == null || m == null || n == null || o == null){
    return 'You have not answered all the questions';
  }
  return 'You have successfully answered all the questions, PLEASE CLICK SUBMIT FORM DOWN BELOW';
}

int calculateFinalScore(var a, var b, var c, var d, var e,
    var f, var g, var h, var i, var j,var k, var l, var m, var n, var o){
  return ((a+b+c+d+e+f+g+h+i+j+k+l+m+n+o)~/15);
}

void createRecord() async {
  await FirebaseFirestore.instance.collection("Forms")
      .doc("$userName").collection('Mini-Asthma-Quality-Life-Questionnaire')
      .doc().set({
    'Submitted_at': DateTime.now(),
    'Score':calculateFinalScore(int.parse(q1answer),int.parse(q2answer),int.parse(q3answer),int.parse(q4answer),int.parse(q5answer),
        int.parse(q6answer),int.parse(q7answer), int.parse(q8answer), int.parse(q9answer), int.parse(q10answer),int.parse(q11answer),
        int.parse(q12answer),int.parse(q13answer),int.parse(q14answer),int.parse(q15answer)),
  });
}