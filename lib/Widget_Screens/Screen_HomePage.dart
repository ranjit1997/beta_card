
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void _LogOutUser()
  {

  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar:  AppBar(
            title: Container(
                 alignment: Alignment.center,
                 child: Text("Home Page",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                 ),
                 backgroundColor: Colors.pink,
               ),

       body: Container() ,

       bottomNavigationBar: BottomAppBar
       (
            color: Colors.pink,
            child: Container
            (
              margin: EdgeInsets.only(left:70.0,right:70.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,

                children: <Widget>
                [
                    IconButton(
                      icon: Icon(Icons.local_car_wash),
                      iconSize: 40,
                      color: Colors.white, 
                      onPressed: _LogOutUser,
                      ),

                    IconButton(
                      icon: Icon(Icons.settings),
                      iconSize: 40,
                      color: Colors.white, 
                      onPressed:null,
                      )
                ],
              ),
            ),
       ),
    );
  }

    
}


