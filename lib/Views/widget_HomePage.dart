
import 'dart:io';

import 'package:beta_card/Utility/DBWebService_FireBase_Authentication.dart';
import 'package:beta_card/Views/widget_SetProfile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
 // MyHomePage({Key key, this.title}) : super(key: key);
 //final String title;

 MyHomePage
 ({
   this.auth,
   this.onSignedOut
 });

 final AuthImplementation auth;
 final VoidCallback onSignedOut;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  
  void logOutUser() async
  {
     try
     {
      await widget.auth.signOut();
      widget.onSignedOut;
     }
     catch(e)
     {
        print("Error:"+e.toString());
     }
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
                  //elevation property is used to set elevation to AppBar in Android Device.
                 elevation: defaultTargetPlatform == TargetPlatform.android ?5.0 : 0.0,
               ),

         
       drawer: navigationDrawer(),

       body: Container() ,

       bottomNavigationBar: bottomMenuBar(),
    );
  }
  

  Widget navigationDrawer()
  {
    return new Drawer(
          // ListView is used to create  static list of items.  
          child: new ListView(
            children: <Widget>[
              //useraccountsdrawerheader is used to show user accounts details on drawer.
              new UserAccountsDrawerHeader(
                 accountName: new Text("Ganesh"),
                 accountEmail: new Text("ganesh@gmail.com"),
                 currentAccountPicture: new CircleAvatar(
                   backgroundColor: Theme.of(context).platform==TargetPlatform.iOS 
                   ? Colors.pink:Colors.white,
                   child: new Text("G"),
                 ),
                 otherAccountsPictures: <Widget>[
                   new CircleAvatar(
                      backgroundColor: Theme.of(context).platform==TargetPlatform.iOS 
                   ? Colors.pink:Colors.white,
                      child: new Text("A"),
                   ),
                 ],
              ),
              //ListTite widget is used to create to items in list view.
              new ListTile(
                   title: new Text("Settings"),//Text widget is used to define text.
                   //onTap widget is used for providing triggering an event.
                   onTap: () {
                     Navigator.of(context).pop(); // this statement is used to close the drawer.
                     Navigator.of(context).pushNamed("/a"); // this statement is used navigate to specified route or page using named route='/a'.
                     },
              ),
              
               new ListTile(
                   title: new Text("Notifications"),
                   
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).pushNamed("/b");
                   },
              ),

                new ListTile(
                   title: new Text("Payment method"),
                   
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).pushNamed("/c");
                   },
              ),

            // Divider widget is used for separating the items or widgets.
              new Divider(),


               new ListTile(
                   title: new Text("SignOut"),
                   
                   onTap: () 
                   {
                     //Navigator.of(context).pop();
                     exit(0);
                   },
              ),
            
               new ListTile(
                   title: new Text("Close"),
                   trailing: new Icon(Icons.close),//Icon widget is used to set Icons for particular items.
                   onTap: ()=> Navigator.of(context).pop(),
              ),
            
              ],
          ),
        );
 
  }
    
  Widget bottomMenuBar()
  {
    return BottomAppBar
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
                      onPressed:()=> logOutUser(),
                      ),
                 /*
                    IconButton(
                      icon: Icon(Icons.photo_camera),
                      iconSize: 40,
                      color: Colors.white, 
                      onPressed:()
                      { 
                        Navigator.push
                                (
                                  context, 
                                  MaterialPageRoute(builder: (context)
                                  {
                                    return new UploadPhotoPage();
                                  })
                                );
                      }
                      ),
                    */
                    IconButton(
                      icon: Icon(Icons.settings),
                      iconSize: 40,
                      color: Colors.white, 
                      onPressed:()
                      {
                         Navigator.push
                                (
                                  context, 
                                  MaterialPageRoute(builder: (context)
                                  {
                                    return new SetUserProfile();
                                  })
                                );
                      },
                      )
                ],
              ),
            ),
       );
  }
}


