import 'package:beta_card/Model/model_monument_name.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ShowMonument extends StatefulWidget {
  @override
  _ShowStateState createState() => _ShowStateState();
}

class _ShowStateState extends State<ShowMonument> {

  List<MyMonument> allData = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Country_Info').child('Monument_Name').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        MyMonument d = new MyMonument(
          data[key]['monument_name'],
          // data[key]['message'],
          // data[key]['profession'],
        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Firebase Data'),
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' No Data is Available')
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      allData[index].monument_name,
                      // allData[index].profession,
                      // allData[index].message,
                    );
                  },
                )),
    );
  }

  Widget UI(String monument_name) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Monument_Name : $monument_name',style: Theme.of(context).textTheme.title,),
            // new Text('Profession : $profession'),
            // new Text('Message : $message'),
          ],
        ),
      ),
    );
  }
}