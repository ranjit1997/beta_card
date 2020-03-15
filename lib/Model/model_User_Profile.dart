import 'dart:io';

class UserProfile
{
  //private variables of this class are declared here..
  String _userFirstName;
  String _userLastName;
  String _userDOB;
  String _userGender;
  int _userMobileNo;
  File _profileImage;

 //setters and getters are declared to access these variables.
  void setFirstName(String firstName)
  {
    _userFirstName = firstName;
  }

  String getFirstName()
  {
    return _userFirstName;
  }

  void setLastName(String lastName)
  {
    _userLastName = lastName;
  }

  String getLastName()
  {
    return _userLastName;
  }

  void setMobileNo(int mobileNo)
  {
    _userMobileNo = mobileNo;
  }

  int getMobileNo()
  {
    return _userMobileNo;
  }

  void setUserDOB(String DOB)
  {
    _userDOB = DOB;
  }

  String getUserDOB()
  {
    return _userDOB;
  }

  void setUserGender(String gender)
  {
    _userGender = gender;
  }

  String getUserGender()
  {
    return _userGender;
  }

  void setUserProfileImage(File sampleImage)
  {
    _profileImage = sampleImage;
  }

  File getUserProfileImage()
  {
    return _profileImage;
  }
}