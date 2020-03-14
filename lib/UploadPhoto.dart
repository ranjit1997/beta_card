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

  UserProfile userProfileObj = new UserProfile();
  UploadUserData userDataObj = new UploadUserData();
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

/*
void UploadStatusImage() async
{

  

final StorageReference userProfileImageRef = FirebaseStorage.instance.ref().child("Profile Images");

var timeKey = new DateTime.now();//it is unique id for every profile image in storage.

final StorageUploadTask uploadTask = userProfileImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);

var ImageUrl = await(await uploadTask.onComplete).ref.getDownloadURL();

url = ImageUrl.toString();
print("Image Url ="+url);

 gotToHomePage();

saveToDatabase(url);

}
*/

/*
void saveToDatabase(url)
{
     var currentTimeKey = new DateTime.now();
     var formatDate = new DateFormat('MMM d,yyyy');
     var formatTime = new DateFormat('EEEE,hh:mm aaa');

     String date = formatDate.format(currentTimeKey);
     String time = formatTime.format(currentTimeKey);

     DatabaseReference ref = FirebaseDatabase.instance.reference();

     var data =
     {
          "image":url,
          "FirstName": _myFirstName,
          "LastName": _myLastName,
          "MobileNo": _myMobileNo,
          "Date":date,
          "Time":time,
     };

     ref.child("UsersInfo").push().set(data);
}

void gotToHomePage()
{
  Navigator.push
  (
    context, 
    MaterialPageRoute(builder: (context)
    {
        return new MyHomePage();
    })
  );
}
*/

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