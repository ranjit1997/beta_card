import 'package:beta_card/BLOC/BLOC_retrive_user_data.dart';
import 'package:beta_card/Model/model_user_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class ShowDataPage extends StatefulWidget {
  @override
  _ShowDataPageState createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  
  List<MyData> allData = [];
  MyData myData = new MyData();//Object creation of model class
  RetriveUserData retriveData = new RetriveUserData();//Object creation of BLOC class
  DatabaseReference ref = FirebaseDatabase.instance.reference();//Object Creation of Firebase Database
  
  @override
  void initState() {
    retriveData.showUserData(allData,myData, ref);
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
                      allData[index].professional,
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