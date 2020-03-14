import 'package:beta_card/BLOC/StudentIDRule_BLOC.dart';
import 'package:beta_card/Model/model_Student_Info.dart';

 

 class StudentDisplay
 {
  StudentID studentObj = new StudentID(); //model class object
 
  StudentVerfication studentBlocObj = new StudentVerfication(); //Bloc class object.
  studentBlocObj.studentIDVerification(studentObj);
 }