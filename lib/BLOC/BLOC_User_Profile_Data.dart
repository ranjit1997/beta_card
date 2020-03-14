
import 'package:beta_card/Model/model_User_Profile.dart';
import 'package:beta_card/Widget_Screens/Screen_HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class UploadUserData
{

String url;
UserProfile userProfile = new UserProfile();

void UploadStatusImage(BuildContext context,File sampleImage) async
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
          "FirstName": userProfile.getFirstName(),
          "LastName":  userProfile.getLastName(),
          "MobileNo":  userProfile.getMobileNo(),
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

}