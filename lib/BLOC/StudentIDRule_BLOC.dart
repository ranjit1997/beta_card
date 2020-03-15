import 'package:beta_card/Model/model_Student_Info.dart';

class StudentVerfication
{
  //method1
  void studentIDVerification(StudentID studentObj) 
  {
    if(studentObj.getStdID()==null)
    {
       print('Register for StudentID');
    }
    else
    print(studentObj.getStdID());
  }

     void method2()
     {
       
     }
  /*
  method2 
   check for student first name
   */

  /*
  method3
   check for student last name
   */

  /*
  method4
    check for attendanceForThirdYear
    if(attendance > 80%)

    */

  /*
  method5
    check for feesPaidForThirdYear
    if(paymentPaidFor2020)
    else
    notpaid 
    */
}