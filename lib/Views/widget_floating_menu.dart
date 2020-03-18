import 'package:flutter/material.dart';


class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
  // implement build
     return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // key: formKey,
          child: Column(
            children: [
              new SizedBox(height: 50.0),
              TextFormField(
                // initialValue: "",
                // onSaved: (val) => item.state = val,
                // validator: (val) => val == "" ? val : null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'First Name',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

               TextFormField(
                // initialValue: "",
                // onSaved: (val) => item.state = val,
                // validator: (val) => val == "" ? val : null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'Last Name',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              TextFormField(
                // initialValue: "",
                // onSaved: (val) => item.district = val,
                // validator: (val) => val == "" ? val : null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'Date/Of/Birth',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

               TextFormField(
                // initialValue: "",
                // onSaved: (val) => item.district = val,
                // validator: (val) => val == "" ? val : null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'Sex',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              RaisedButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () {
                  // handleSubmit();
                },
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(12),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}