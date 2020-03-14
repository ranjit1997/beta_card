
import 'package:beta_card/Authentication.dart';
import 'package:beta_card/Mapping.dart';
import 'package:beta_card/Widget_Screens/Screen_LoginRegister.dart';
import 'package:beta_card/Widget_Screens/Screen_HomePage.dart';
import 'package:beta_card/Model/model_User_Profile.dart';
import 'package:flutter/material.dart';


UserProfile userProfileObj = new UserProfile();//model class object.

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
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
     
      home: MappingPage(auth: Auth(),),
    );
  }
}
