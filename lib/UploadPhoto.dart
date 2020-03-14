import 'package:beta_card/Model/model_User_Profile.dart';
import 'package:beta_card/Widget_Screens/Screen_HomePage.dart';
import 'package:beta_card/BLOC/BLOC_User_Profile_Data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPhotoPage extends StatefulWidget
{
  _UploadPhotoPageState createState()=> new _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage>
{

  UserProfile userProfileObj = new UserProfile(); //model class Object.
  UploadUserData userDataObj = new UploadUserData(); // BLOC class Object.
  File sampleImage;
 // String _myFirstName,_myLastName,_myMobileNo,_myDOB,_myGender;
  //String url;
  final formKey = new GlobalKey<FormState>();
  

  Future getImage() async
  {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() 
    {
      sampleImage = tempImage;
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
  Widget build(BuildContext context) 
  {
    
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Upload Image",style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),

      body: new Center
      (
        child: sampleImage ==null?Text("Select an image"):enableUpload(),
      ),

      floatingActionButton: FloatingActionButton
      (
        onPressed: getImage,
        tooltip: 'Add Image',
        backgroundColor: Colors.pink,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget enableUpload()
  {
    return SingleChildScrollView(
    child: Container
    (
      child: Form
      (
       key: formKey,
       child: Column
       (
         children: <Widget>
         [
           Image.file(sampleImage,height:330.0, width:600.0),

           SizedBox(height: 15.0,),
           TextFormField
           (
             decoration: InputDecoration(labelText:'FirstName'),
             validator: (value)
             {
               return value.isEmpty?'Enter FirstName':null;
             },

             onSaved: (value)
             {
                //return _myFirstName = value;
                return userProfileObj.setFirstName(value);
             },
           ),

           SizedBox(height:10.0),

            TextFormField
           (
             decoration: InputDecoration(labelText:'LastName'),
             validator: (value)
             {
               return value.isEmpty?'Enter LastName':null;
             },

             onSaved: (value)
             {
                //return _myLastName = value;
                return userProfileObj.setLastName(value);
             },
           ),

           SizedBox(height:10.0),
           
           TextFormField
           (
             decoration: InputDecoration(labelText:'Mobile Number'),
             validator: (value)
             {
               return value.isEmpty?'Enter Mobile Number':null;
             },

             onSaved: (value)
             {
                //return _myMobileNo = value;
                return userProfileObj.setMobileNo(int.parse(value));
             },
           ),

           SizedBox(height:10.0),


           RaisedButton
           (
             elevation: 10.0,
             child: Text("Update Profile"),
             textColor: Colors.white,
             color: Colors.pink,
             onPressed:()=>
             { 
               userDataObj.UploadStatusImage(context,sampleImage)
             },
           ),
         ],
       ),
       ),
       ),
       );
    
  }
}