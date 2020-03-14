import 'package:beta_card/Model/model_Student_Info.dart';

class StudentVerfication
{
  void studentIDVerfication(StudentID studentObj)
  {
    if(studentObj.getStdID(101)==null)
    {
       print('Register for StudentID');
    }
    else
    print(studentObj.getStdID(101));
  }
}