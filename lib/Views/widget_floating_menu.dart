import 'package:flutter/material.dart';


const email = '';
const phone = '';

class UserProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //This is circle image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/ranjeete.jpg'),
            ),
            //This is user for divider
            SizedBox(
              height:35.0,
            ),
            //This is user name text
            Text(
              'Ranjeet Kumar',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                color: Colors.teal[50],
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            //This is use for divider 
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.teal.shade700,
              ),
            ),
            //This is use for divider
            SizedBox(
              height:20.0,
            ),
            //This is email card
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
            //This is phone card
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
          ],
        ),
      ),
       backgroundColor: Colors.teal[200],
       //This is floating action button
       floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(Icons.create),
              backgroundColor: Colors.blue,
             ),
    );
  }
}