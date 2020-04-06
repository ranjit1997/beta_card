import 'package:beta_card/Views/widget_floating_menu.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Register New User',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                color: Colors.teal[50],
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            // This is use for spacing and using divider widget
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.teal.shade700,
              ),
            ),
            // This is use for only spacing
            SizedBox(
              height:20.0,
            ),
            //This is first name card
            new Card(
              color: Colors.white,
               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                 leading: Icon(
                  Icons.person,
                 color: Colors.teal,
                ),
                title: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      hintText: 'First Name'
                   ),
                ),
              ),
            ),
            // This is last name card
             new Card(
              color: Colors.white,
               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                 leading: Icon(
                  Icons.person,
                 color: Colors.teal,
                ),
                title: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      hintText: 'Last Name'
                   ),
                ),
              ),
            ),
            // This is phone card
             new Card(
              color: Colors.white,
               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                 leading: Icon(
                  Icons.phone,
                 color: Colors.teal,
                ),
                title: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      hintText: '+91 8213546478'
                   ),
                 ),
               ),
             ),
             // This is mail card
             new Card(
              color: Colors.white,
               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                 leading: Icon(
                  Icons.email,
                 color: Colors.teal,
                ),
                title: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      hintText: 'abc@example.com'
                   ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
           //This is submit button
           RaisedButton(
             padding: const EdgeInsets.all(13.0),
             color: Colors.white,
             onPressed: () {
             //Write the on pressed function
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => new UserProfile()));
             },
              child: const Text(
               '    Register    ',
              style: TextStyle(fontSize: 15.0,)
            ),
           ),
          ],
         ),
       ),
       backgroundColor: Colors.teal[200],
    );
  }
}