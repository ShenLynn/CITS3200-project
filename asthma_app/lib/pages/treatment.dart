import 'package:flutter/material.dart';

class Treatment extends StatefulWidget {
  _TreatmentState createState() => _TreatmentState();
}

class TreatmentDetails {
  String name;
  String details;

  TreatmentDetails({ String name, String details }){
    this.name = name;
    this. details = details;
  }
}

class _TreatmentState extends State<Treatment> {

  List<TreatmentDetails> treatments = [
    TreatmentDetails(name: 'Symbicort', details: '200/6 2 puffs twice daily using a turbuhaler'),
    TreatmentDetails(name: 'Mometason', details: 'Nasal Spray'),
    TreatmentDetails(name: 'Tiotropoim', details: '2.5mcg 2 puffs once daily using a Respimat.'),
  ];

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
                  itemCount: treatments.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            treatments[index].name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          subtitle: Text(
                            treatments[index].details,
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
              /*child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Container(
                        height: 50,
                        color: Colors.blue[50],
                        child: const Center(child: Text(
                          'Symbicort',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        )),
                      ),
                      Container(
                        height: 100,
                        child: const Center(child: Text(
                          '200/6 2 puffs twice daily using a turbuhaler',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.0,
                          ),
                        )),
                      ),
                      Container(
                        height: 50,
                        color: Colors.blue[50],
                        child: const Center(child: Text(
                          'Mometason',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        )),
                      ),
                      Container(
                        height: 100,
                        child: const Center(child: Text(
                          'Nasal Spray',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.0,
                          ),
                        )),
                      ),
                      Container(
                        height: 50,
                        color: Colors.blue[50],
                        child: const Center(child: Text(
                          'Tiotropoim',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        )),
                      ),
                      Container(
                        height: 100,
                        child: const Center(child: Text(
                          '2.5mcg 2 puffs once dialy using a Respimat.',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.0,
                          ),
                        )),
                      ),
                      Container(
                        height: 50,
                        color: Colors.blue[50],
                        child: const Center(child: Text(
                          'Extra Notes',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        )),
                      ),
                      Container(
                        height: 200,
                        child: const Center(child: Text(
                          'My inhaler technique was last checked at the hospital on 01/01/20. In the last year I collected 80% of my preventer prescriptions. My asthma action plan was revised on 01/01/20.',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.0,
                          ),
                        )),
                      ),
                    ]
                )*/
            );
          },
        ),
      ),
    );
  }
}