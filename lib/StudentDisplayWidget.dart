import 'package:beta_card/BLOC/StudentIDRule_BLOC.dart';
import 'package:beta_card/Model/model_Student_Info.dart';

 

 class StudentDisplay
 {
  StudentID studentObj = new StudentID();
 
  StudentVerfication studentBlocObj = new StudentVerfication();
  studentBlocObj.studentIDVerification(studentObj);
 }