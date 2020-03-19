import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo HomePage2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
       
        child:Form(
          child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              AbsorbPointer
              (
                absorbing: true,
                child: TextFormField
                (
                   decoration: InputDecoration(icon:Icon(Icons.person_outline),labelText:'FirstName'),
                   
                   
                ),
              ),
              
               SizedBox(height: 15.0,),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>
                [ 
              TextFormField
                (
                   decoration: InputDecoration(icon:Icon(Icons.person_outline),labelText:'LastName'),
                   enabled: true,
                   
                ),
                IconButton(icon: Icon(Icons.edit), onPressed:null),
                ],
              ),
          ],
          ),
          ),
          ),     
    );
  }

 
}
