import 'package:beta_card/EditableNonEditableTextField.dart';
import 'package:beta_card/EditableTextField.dart';
import 'package:beta_card/ProfilePage.dart';
import 'package:beta_card/TextField2.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.pink,
      ),
     // home: MyHomePage(title: 'Flutter Demo HomePage2'),
     //home: ProfilePage(),
     //home:DisableTextField1(),
     home:DisableTextField2(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

  
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  

//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
       
//         title: Text(widget.title),
//       ),
//       body: Center(
    
//           child: Column(
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
             
                           
//           ],
//           ),
//           ),
               
//     );
//   }

 
// }
