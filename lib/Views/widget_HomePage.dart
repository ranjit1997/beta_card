
import 'package:beta_card/Utility/DBWebService_FireBase_Authentication.dart';
import 'package:beta_card/Views/widget_UploadPhoto.dart';
import 'package:beta_card/model_UserInfo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
 // MyHomePage({Key key, this.title}) : super(key: key);
 //final String title;

 MyHomePage
 ({
   this.auth,
   this.onSignedOut
 });

 final AuthImplementation auth;
 final VoidCallback onSignedOut;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<UsersInfo> usersInfoList =[];

  @override
  void initState()
  {
    super.initState();

    DatabaseReference usersInfoRef = FirebaseDatabase.instance.reference().child("UsersInfo");

    usersInfoRef.once().then((DataSnapshot snap)
    {
         var KEYS = snap.value.keys;
         var DATA = snap.value;

         usersInfoList.clear();

         for(var individualKeys in KEYS)
         {
           UsersInfo usersInfo = new UsersInfo
           (
             DATA[individualKeys]['FirstName'], 
             DATA[individualKeys]['LastName'], 
             DATA[individualKeys]['MobileNo'], 
             DATA[individualKeys]['image'], 
             DATA[individualKeys]['Date'], 
             DATA[individualKeys]['Time']
           );

           usersInfoList.add(usersInfo);
         }

         setState(() 
         {
            print('Length: $usersInfoList.length');  
         });
    }); 
  }
  
  void logOutUser() async
  {
     try
     {
      await widget.auth.signOut();
      widget.onSignedOut;
     }
     catch(e)
     {
        print("Error:"+e.toString());
     }
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar:  AppBar(
            title: Container(
                 alignment: Alignment.center,
                 child: Text("Home Page",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                 ),
                 backgroundColor: Colors.pink,
               ),

       body: Container
       (
         child: usersInfoList.length==0?Text("No User Info is available"):ListView.builder
         (
           itemCount: usersInfoList.length,
           itemBuilder: (_,index)
           {
             return userInfoWidget(usersInfoList[index].FirstName, usersInfoList[index].LastName, 
             usersInfoList[index].MobileNo, usersInfoList[index].image, usersInfoList[index].Date, 
             usersInfoList[index].Time);
           }
         ),
       ) ,

       bottomNavigationBar: BottomAppBar
       (
            color: Colors.pink,
            child: Container
            (
              margin: EdgeInsets.only(left:70.0,right:70.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,

                children: <Widget>
                [
                    IconButton(
                      icon: Icon(Icons.local_car_wash),
                      iconSize: 40,
                      color: Colors.white, 
                      onPressed:()=> logOutUser(),
                      ),

                    IconButton(
                      icon: Icon(Icons.photo_camera),
                      iconSize: 40,
                      color: Colors.white, 
                      onPressed:()
                      { 
                        Navigator.push
                                (
                                  context, 
                                  MaterialPageRoute(builder: (context)
                                  {
                                    return new UploadPhotoPage();
                                  })
                                );
                      }
                      ),

                    IconButton(
                      icon: Icon(Icons.settings),
                      iconSize: 40,
                      color: Colors.white, 
                      onPressed:null,
                      )
                ],
              ),
            ),
       ),
    );
  }

    Widget userInfoWidget(String FirstName,String LastName,int MobileNo,String image,String Date,String Time)
    {
      return Card
      (
          elevation: 10.0,
          margin: EdgeInsets.all(15.0),

          child: Container
          (
            padding: EdgeInsets.all(15.0),

            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>
                [
                Text
                (
                  Date,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),

                 Text
                (
                  Time,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
                ],
                ),

                SizedBox(height:10.0),
                Image.network(image,fit:BoxFit.cover),
                
                SizedBox(height:10.0),

                 Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>
                [
                Text
                (
                  FirstName,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),

                 Text
                (
                  LastName,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),
                ],
                ),
                
                 
              ],
            ),
          ),
      );
    }
}


