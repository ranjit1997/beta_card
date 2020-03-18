
import 'package:beta_card/Model/model_User_Profile.dart';
import 'package:beta_card/Utility/DBWebService_FireBase_User_Profile_Data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class UploadPhotoPage extends StatefulWidget
{
  _UploadPhotoPageState createState()=> new _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage>
{

  final formKey = new GlobalKey<FormState>();

  UserProfile userProfileObj = new UserProfile(); //model class Object.
  UploadUserData userDataObj = new UploadUserData(); // BLOC class Object.
 // File sampleImage;
 
  Future getImage() async
  {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() 
    {
      //sampleImage = tempImage;
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
        child: userProfileObj.getUserProfileImage() ==null?Text("Select an image"):enableUpload(),
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
      margin: EdgeInsets.all(15.0),
      child: Form
      (
       key: formKey,
       child: Column
       (
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>
         [
           Image.file(userProfileObj.getUserProfileImage(),height:330.0, width:600.0),

           SizedBox(height: 15.0,),
           TextFormField
           (
             decoration: InputDecoration(icon:Icon(Icons.person_outline),labelText:'FirstName'),
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

           SizedBox(height:10.0),

            TextFormField
           (
             decoration: InputDecoration(icon:Icon(Icons.person_outline),labelText:'LastName'),
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
             decoration: InputDecoration(icon:Icon(Icons.phone),labelText:'Mobile Number'),
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
               if(validateAndSave())
               {
                 userDataObj.UploadStatusImage(context,userProfileObj) //passing model object in BLOC method.
               }, 
             },
           ),
         ],
       ),
       ),
       ),
       );
    
  }
}