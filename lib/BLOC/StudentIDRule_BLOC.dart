import 'package:beta_card/Model/model_Student_Info.dart';

class StudentVerfication
{
  void studentIDVerification(StudentID studentObj) 
  {
    if(studentObj.getStdID()==null)
    {
       print('Register for StudentID');
    }
    else
    print(studentObj.getStdID());
  }
}