import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class DisableTextField2 extends StatefulWidget {
  @override
  DisableTextFieldState createState() {
    return new DisableTextFieldState();
  }
}

class DisableTextFieldState extends State<DisableTextField2> {
  TextEditingController _firstNameFieldController = TextEditingController();
  TextEditingController _lastNameFieldController = TextEditingController();
  TextEditingController _mobileNoFieldController = TextEditingController();
  TextEditingController _emailIDFieldController = TextEditingController();
  bool _isEnabled = false;
  //bool _isEnabled;
  File _image;


/*
    bool editFirstName(TextEditingController controller)
    {
      if(controller==_firstNameFieldController)
      {
        setState(() {
           _isEnabled = true;
              
        });
        
      }
      else{
        setState(() {
          _isEnabled =false;
        });
      }
    }

     bool editLastName(TextEditingController controller)
    {
      if(controller ==_lastNameFieldController)
      {
        setState(() {
          // _isEnabled = !_isEnabled;
          _isEnabled = true;
        });
      }
      else{
        setState(() {
             _isEnabled= false;
        });
      }
    }
*/

  @override
  Widget build(BuildContext context) {

       Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
          print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async{
      // String fileName = basename(_image.path);
      //  StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      //  StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      //  StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      //  setState(() {
      //     print("Profile Picture uploaded");
      //     Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      //  });

      _firstNameFieldController.text = "Shankar";
      _lastNameFieldController.text="Pawar";
      _mobileNoFieldController.text="7894561230";
      _emailIDFieldController.text="shankar@gmail.com";
    }




    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          _isEnabled = !_isEnabled;
        });
      },
    )
  ],
      ),
      body:Builder(
        builder: (context) =>  Container(
          child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.pink,
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):Image.asset(
                            "images/profile_image.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
                 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[ 
                       
                       Expanded(
                            child:Align(
                            alignment: Alignment.centerLeft,
                            child:Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child:TextField(
                               controller: _firstNameFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                               //enabled: false,
                               decoration: InputDecoration(hintText: "FirstName"),),
                               
                            ),
                            ),

                          ),
                        ],
                  
                  ),
                  /*
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child:IconButton(icon:  Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.pink,
                      ), 
                      onPressed:() =>  
                       
                        
                       //  _isEnabled = !_isEnabled;
                          editFirstName(_firstNameFieldController)
                        
                      
                       ), 
                    ),
                  ),
                */
                  
                   SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[   
                       Expanded(
                            child:Align(
                            alignment: Alignment.centerLeft,
                            child:Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child:TextField(
                               controller: _lastNameFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                               //enabled: false,
                                   decoration: InputDecoration(hintText: "LastName"),),
                            ),      
                          ),
                          ),
                        ],
                  
                  ),
                  /*
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child:IconButton(icon:  Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.pink,
                      ), 
                      onPressed:() =>  
                         //_isEnabled = !_isEnabled;
                         editLastName(_lastNameFieldController),
                         
                       ), 
                    ),
                  ),
                 
                */
                  SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[   
                       Expanded(
                            child:Align(
                            alignment: Alignment.centerLeft,
                            child:Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child:TextField(
                               controller: _mobileNoFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                               //enabled:false,
                                   decoration: InputDecoration(hintText: "Mobile Number"),),
                            ),      
                          ),
                          ),
                        ],
                  
                  ),
                  /*
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child:IconButton(icon:  Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.pink,
                      ), 
                      onPressed:() =>  
                         //_isEnabled = !_isEnabled;
                         //editLastName(_lastNameFieldController),
                         null,
                       ), 
                    ),
                  ),
              */
               SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[   
                       Expanded(
                            child:Align(
                            alignment: Alignment.centerLeft,
                            child:Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child:TextField(
                               controller: _emailIDFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                               //enabled:false,
                               decoration: InputDecoration(hintText: "Email ID"),),
                                   
                            ),      
                          ),
                          ),
                        ],
                  
                  ),
                  /*
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child:IconButton(icon:  Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.pink,
                      ), 
                      onPressed:() =>  
                         //_isEnabled = !_isEnabled;
                         //editLastName(_lastNameFieldController),
                         null,
                       ), 
                    ),
                  ),
                    */
                   SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.pink,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.pink,
                    onPressed: () {
                     uploadPic(context);
                    },
                                     
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
              
                ],
              )



                ],
              ),
             
        
          ),
        ),
        ),);
        
  }
}