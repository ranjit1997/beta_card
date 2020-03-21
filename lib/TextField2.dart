import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class DisableTextField1 extends StatefulWidget {
  @override
  DisableTextFieldState createState() {
    return new DisableTextFieldState();
  }
}

class DisableTextFieldState extends State<DisableTextField1> {
  TextEditingController _textFieldController = TextEditingController();
  bool _isEnabled = false;
  File _image;

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
      String fileName = basename(_image.path);
       StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
       StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
       StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
       setState(() {
          print("Profile Picture uploaded");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
       });
    }




    return Scaffold(
      appBar: AppBar(
        title: Text('Disable TextField Example'),
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
                          ):Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
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
                               controller: _textFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                                   decoration: InputDecoration(hintText: "FirstName"),),
                            ),
                            ),

                          ),
                        ],
                  
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child:IconButton(icon:  Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.pink,
                      ), 
                      onPressed:() => setState(() 
                      { 
                        _isEnabled = !_isEnabled;
                        
                      }),
                       ), 
                    ),
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
                            child:TextField(
                               controller: _textFieldController,
                                 //Set this field to enable or disable (true or flase)
                               enabled: _isEnabled,
                                   decoration: InputDecoration(hintText: "LastName"),),
                            ),      
                          ),
                          ),
                        ],
                  
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child:IconButton(icon:  Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.pink,
                      ), 
                      onPressed:() => setState(() => _isEnabled = !_isEnabled),
                       ), 
                    ),
                  ),

              

                ],
              ),
             
        
          ),
        ),
        ),);
        
  }
}