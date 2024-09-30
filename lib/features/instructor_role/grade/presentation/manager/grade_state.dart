
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';

import '../../domain/entities/grade_entity.dart';

sealed class InsGradeState {}

final class GradeInitial extends InsGradeState {}

class GetGradeLoadingState extends InsGradeState{}
class GetGradeSuccessState extends InsGradeState{
  static double totalGrade=0;
  static setTotalGrade(double total){
     totalGrade=total;
  }
  final List<InsGradeEntity>  gradeEntity;
  GetGradeSuccessState({required this.gradeEntity});
}
class GetGradeErrorState extends InsGradeState{
  final String errMessage;
  GetGradeErrorState(this.errMessage);
}



class GetStudentForCourseLoadingState extends InsGradeState{}
class GetStudentForCourseSuccessState extends InsGradeState{
  static List<StudentEntity>  allStudents=[];
  static setAllStudents(List<StudentEntity> students){
    allStudents=students;
  }
}
class GetStudentForCourseErrorState extends InsGradeState{
  final String errMessage;
  GetStudentForCourseErrorState(this.errMessage);
}