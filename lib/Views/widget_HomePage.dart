
import 'package:beta_card/Utility/DBWebService_FireBase_Authentication.dart';
import 'package:beta_card/Views/widget_UploadPhoto.dart';
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
                      onPressed:()=> logOutUser(),
                      ),

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


