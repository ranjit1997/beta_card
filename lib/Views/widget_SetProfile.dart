import 'dart:io';

import 'package:beta_card/Data_Model/Data_Model_User_Profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SetUserProfile extends StatefulWidget {
  @override
  _SetUserProfileState createState() {
    return new _SetUserProfileState();
  }
}

class _SetUserProfileState extends State<SetUserProfile> 
{
  TextEditingController _firstNameFieldController = TextEditingController();
  TextEditingController _lastNameFieldController = TextEditingController();
  TextEditingController _mobileNoFieldController = TextEditingController();
  TextEditingController _emailIDFieldController = TextEditingController();
  bool _isEnabled = false;
  
  

  
  final formKey = new GlobalKey<FormState>();

  Future getImage() async
  {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() 
    {
      
      userProfileObj.setUserProfileImage(tempImage);
    });
  }

  
   

  bool validateAndSave()
  {
    final form = formKey.currentState;
    if(form.validate())
    {
      form.save();
      return true;
    }
    else
    return false;
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.pink,
        actions: <Widget>
         [
           Container(
               margin:const EdgeInsets.only(left:100.0),
               child: IconButton
                (
                   icon: Icon
                  (
                   _isEnabled ? IconData(58826,fontFamily: 'MaterialIcons'):IconData(57680,fontFamily: 'MaterialIcons')
                  ),
                  onPressed: (){
                           setState(() {
                                      _isEnabled = !_isEnabled;
         
                                   }); 
                                },
                  //shape: CircleBorder(),
                  color: Colors.white,
               ),
            ),
         ],
      ),
      body:Builder(
        builder: (context) =>  Container(
          child:SingleChildScrollView(
          child:Form
          ( 
            key: formKey,
          child:Column(
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
                          child: ( userProfileObj.getUserProfileImage()!=null)?Image.file(
                             userProfileObj.getUserProfileImage(),
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
                            child:TextFormField
                            (
                               controller: _firstNameFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                               //enabled: false,
                               decoration: InputDecoration(icon:Icon(Icons.person_outline),hintText: "FirstName"),
                               
                               validator: (value)
                                 {
                                    return value.isEmpty?'Enter FirstName':null;
                                 },

                               onSaved: (value)
                                   {
                                     //return _myFirstName = value;
                                      return userProfileObj.setFirstName(value);
                                    //assigning data through setter methods.
                                   },
                            ),
   
                            ),
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
                            child:Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child:TextFormField
                            (
                               controller: _lastNameFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                               //enabled: false,
                               decoration: InputDecoration(icon:Icon(Icons.person_outline),hintText: "LastName"),
                               
                               validator: (value)
                                 {
                                    return value.isEmpty?'Enter LastName':null;
                                 },

                               onSaved: (value)
                                   {
                                     //return _myFirstName = value;
                                      return userProfileObj.setLastName(value);
                                    //assigning data through setter methods.
                                   },
                              
                                   
                            ),
                            ),      
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
                            child:Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child:TextFormField
                            (
                               controller: _mobileNoFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                               //enabled:false,
                               decoration: InputDecoration(icon:Icon(Icons.phone),hintText: "Mobile Number"),

                                validator: (value)
                                 {
                                    return value.isEmpty?'Enter Mobile Nummber':null;
                                 },

                               onSaved: (value)
                                   {
                                     //return _myFirstName = value;
                                      return userProfileObj.setMobileNo(int.parse(value));
                                    //assigning data through setter methods.
                                   },   
                            ),
                            ),      
                          ),
                          ),
                        ],
                  
                  ),
                 
               SizedBox(
                height: 10.0,
              ),
              /*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[   
                       Expanded(
                            child:Align(
                            alignment: Alignment.centerLeft,
                            child:Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child:TextFormField
                            (
                               controller: _emailIDFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                               //enabled:false,
                               decoration: InputDecoration(hintText: "Email ID"),

                                validator: (value)
                                 {
                                    return value.isEmpty?'Enter Email ID':null;
                                 },

                               onSaved: (value)
                                   {
                                     //return _myFirstName = value;
                                      return userProfileObj.setFirstName(value);
                                    //assigning data through setter methods.
                                   },
                            ),
                                   
                            ),      
                          ),
                          ),
                        ],
                  
                  ),
                 
                   SizedBox(
                height: 10.0,
              ),
              */
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
                    onPressed: () 
                    {

                      if(validateAndSave())
                        {
                 
                           userDataObj.UploadStatusImage(context); //passing model object in BLOC method.
                        }
                        
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
        ),
        ),
        );
        
  }
}