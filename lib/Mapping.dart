import 'package:flutter/material.dart';
import 'package:beta_card/Widget_Screens/Screen_LoginRegister.dart';
import 'package:beta_card/Widget_Screens/Screen_HomePage.dart';
import 'Authentication.dart';

//This class is used to check the state of user whether loggedIn or not.
class MappingPage extends StatefulWidget
{
  final AuthImplementation auth;

  MappingPage
  ({
       this.auth,
  });
  
  _MappingPageState createState() => _MappingPageState();
}

enum AuthStatus
{
  notSignedIn,
  signedIn
}
class _MappingPageState extends State<MappingPage>
{

  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState()
  {
    super.initState();

    widget.auth.getCurrentUser().then((firebaseUserId)
    {
             setState(() 
             {
              authStatus = firebaseUserId == null? AuthStatus.notSignedIn:AuthStatus.signedIn;  
             });
    });
  }

   void _signedIn()
   {
     setState(() 
     {
        authStatus = AuthStatus.signedIn; 
     });
   }


    void _signedOut()
   {
     setState(() 
     {
        authStatus = AuthStatus.notSignedIn; 
     });
   }

  @override
  Widget build(BuildContext context) 
  {

     switch(authStatus)
     {
       case AuthStatus.notSignedIn:
       return new LoginRegisterPage
       (
          auth:widget.auth,
          onSignedIn: _signedIn,
       );

      case AuthStatus.signedIn:
       return new MyHomePage
       (
          auth:widget.auth,
          onSignedOut: _signedOut,
       );


     }
    
    return null;
  }
}