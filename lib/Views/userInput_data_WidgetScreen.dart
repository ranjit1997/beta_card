import 'package:beta_card/BLOC/BLOC_add_user_data.dart';
import 'package:beta_card/Model/model_user_data.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
    GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
 // String name, profession, message;

   MyData myData = new MyData();// Object creation of model
   AddUserData addUserData = new AddUserData(); // Object creation of BLOC


  List<DropdownMenuItem<String>> items = [
    new DropdownMenuItem(
      child: new Text('Student'),
      value: 'Student',
    ),
    new DropdownMenuItem(
      child: new Text('Professor'),
      value: 'Professor',
    ),
  ];


  bool validateAndSave()
  {
       if (_key.currentState.validate()) 
         {
           _key.currentState.save();
            return true;
           _key.currentState.reset();
         }
     else
        {
           setState(() {
              _autovalidate = true;
           });
           
        }
  } 
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Firebase Database'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _autovalidate,
              child: formUI(),
            ),
          ),
        ),
    );
  }

  Widget formUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Flexible(
              child: new TextFormField(
                decoration: new InputDecoration(hintText: 'Name'),
                validator: validateName,
                onSaved: (val) {
                  //name = val;
                    myData.setUserName(val); // assigning value to model class.
                },
                maxLength: 32,
              ),
            ),
            new SizedBox(width: 10.0),
            new DropdownButtonHideUnderline(
                child: new DropdownButton(
              items: items,
              hint: new Text('Profession'),
              value: profession,
              onChanged: (String val) {
                setState(() {
                  //profession = val;
                     myData.setUserProfession(val);
                });
              },
            ))
          ],
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Message'),
          onSaved: (val) {
            //message = val;
              myData.setUserMessage(val); // assigning value to the model class.
          },
          validator: validateMessage,
          maxLines: 5,
          maxLength: 256,
        ),
        new RaisedButton(
          onPressed:()
                      { 
                        if(validateAndSave())
                         {
                            addUserData.sendToServer(myData)
                         },   
                       } ,
             
          child: new Text('Send'),
        ),
        new SizedBox(height: 20.0),
        new RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new ShowDataPage()));
          },
          child: new Text('Show Data'),
        )
      ],
    );
  }


  String validateName(String val) {
    return val.length == 0 ? "Enter Name First" : null;
  }

  String validateMessage(String val) {
    return val.length == 0 ? "Enter Email First" : null;
  }

}