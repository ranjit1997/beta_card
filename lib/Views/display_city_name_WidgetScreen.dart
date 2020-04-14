// import 'package:beta_card/BLOC/BLOC_add_user_data.dart';
// import 'package:beta_card/Model/model_user_data.dart';
// import 'package:flutter/material.dart';

// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//     GlobalKey<FormState> _key = new GlobalKey();
//   bool _autovalidate = false;
//  // String name, profession, message;

//    MyData myData = new MyData();// Object creation of model
//    AddUserData addUserData = new AddUserData(); // Object creation of BLOC


//   List<DropdownMenuItem<String>> items = [
//     new DropdownMenuItem(
//       child: new Text('Student'),
//       value: 'Student',
//     ),
//     new DropdownMenuItem(
//       child: new Text('Professor'),
//       value: 'Professor',
//     ),
//   ];


//   bool validateAndSave()
//   {
//        if (_key.currentState.validate()) 
//          {
//            _key.currentState.save();
//             return true;
//            _key.currentState.reset();
//          }
//      else
//         {
//            setState(() {
//               _autovalidate = true;
//            });
           
//         }
//   } 
  
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Firebase Database'),
//         ),
//         body: new SingleChildScrollView(
//           child: new Container(
//             padding: new EdgeInsets.all(15.0),
//             child: new Form(
//               key: _key,
//               autovalidate: _autovalidate,
//               child: formUI(),
//             ),
//           ),
//         ),
//     );
//   }

//   Widget formUI() {
//     return new Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         new Row(
//           children: <Widget>[
//             new Flexible(
//               child: new TextFormField(
//                 decoration: new InputDecoration(hintText: 'Name'),
//                 validator: validateName,
//                 onSaved: (val) {
//                   //name = val;
//                     myData.setUserName(val); // assigning value to model class.
//                 },
//                 maxLength: 32,
//               ),
//             ),
//             new SizedBox(width: 10.0),
//             new DropdownButtonHideUnderline(
//                 child: new DropdownButton(
//               items: items,
//               hint: new Text('Profession'),
//               value: profession,
//               onChanged: (String val) {
//                 setState(() {
//                   //profession = val;
//                      myData.setUserProfession(val);
//                 });
//               },
//             ))
//           ],
//         ),
//         new TextFormField(
//           decoration: new InputDecoration(hintText: 'Message'),
//           onSaved: (val) {
//             //message = val;
//               myData.setUserMessage(val); // assigning value to the model class.
//           },
//           validator: validateMessage,
//           maxLines: 5,
//           maxLength: 256,
//         ),
//         new RaisedButton(
//           onPressed:()
//                       { 
//                         if(validateAndSave())
//                          {
//                             addUserData.sendToServer(myData)
//                          },   
//                        } ,
             
//           child: new Text('Send'),
//         ),
//         new SizedBox(height: 20.0),
//         new RaisedButton(
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => new ShowDataPage()));
//           },
//           child: new Text('Show Data'),
//         )
//       ],
//     );
//   }


//   String validateName(String val) {
//     return val.length == 0 ? "Enter Name First" : null;
//   }

//   String validateMessage(String val) {
//     return val.length == 0 ? "Enter Email First" : null;
//   }

// }
import 'package:beta_card/Model/model_city_name.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ShowCity extends StatefulWidget {
  @override
  _ShowStateState createState() => _ShowStateState();
}

class _ShowStateState extends State<ShowCity> {

  List<MyCity> allData = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Country_Info').child('City_Name').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        MyCity d = new MyCity(
          data[key]['city_name'],
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
                      allData[index].city_name,
                      // allData[index].profession,
                      // allData[index].message,
                    );
                  },
                )),
    );
  }
 
  Widget UI(String city_name) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('City_Name : $city_name',style: Theme.of(context).textTheme.title,),
            // new Text('Profession : $profession'),
            // new Text('Message : $message'),
          ],
        ),
      ),
    );
  }

  void DisplayCity(String country){
    
  }
}