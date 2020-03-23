//This File contain all object initialization . 

import 'package:beta_card/Model/model_User_ID.dart';
import 'package:beta_card/Model/model_User_Profile.dart';
import 'package:beta_card/Utility/DBWebService_FireBase_User_Profile_Data.dart';
import 'package:beta_card/Views/widget_DialogBox.dart';
import 'package:beta_card/Views/widget_LoginRegister.dart';



  UserProfile userProfileObj = new UserProfile(); //model class Object.
  UploadUserData userDataObj = new UploadUserData(); // BLOC class Object.
  LoginRegisterPage loginRegPage = new LoginRegisterPage();
  UserID user_ID = new UserID();
  DialogBox dialogBox = new DialogBox();
  