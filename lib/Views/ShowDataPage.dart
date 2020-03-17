import 'package:beta_card/Model/myData.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class ShowDataPage extends StatefulWidget {
  @override
  _ShowDataPageState createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  List<MyData> allData = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('node-name').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        MyData d = new MyData(
          data[key]['name'],
          data[key]['message'],
          data[key]['profession'],
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
                    return uI(
                      allData[index].name,
                      allData[index].profession,
                      allData[index].message,
                    );
                  },
                )),
    );
  }

  Widget uI(String name, String profession, String message) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Name : $name',style: Theme.of(context).textTheme.title,),
            new Text('Profession : $profession'),
            new Text('Message : $message'),
          ],
        ),
      ),
    );
  }
}