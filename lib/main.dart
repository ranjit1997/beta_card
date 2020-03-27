

import 'package:beta_card/Mapping.dart';
import 'package:beta_card/Utility/DBWebService_FireBase_Authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:beta_card/Views/widget_GalleryEventPage.dart';
import 'package:beta_card/Views/widget_WalletPage.dart';
import 'package:beta_card/Views/widget_SupportPage.dart';


void main() 
{ 
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.pink,
       primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50] : null
        
      ),
     
      home: MappingPage(auth: Auth(),),
      
      routes: <String,WidgetBuilder>{
        // When navigating to the "/a" route, build the Settings Page widget.
        '/a':(BuildContext context) => new SupportPage(),
         // When navigating to the "/b" route, build the Notification widget. 
        '/b':(BuildContext context) => new GalleryEventsPage(),
         // When navigating to the "/c" route, build the Payment Page widget.
        '/c':(BuildContext context) => new WalletPage(),
        
      },
    );
  }
}
