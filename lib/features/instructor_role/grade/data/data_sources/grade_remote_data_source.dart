import 'package:universityhup/features/instructor_role/grade/data/models/student_model.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/grade_entity.dart';
import '../models/grade_model.dart';


abstract class InsGradeRemoteDataSource {
  Future<List<InsGradeEntity>> getGrade({required String studentId});
  Future<List<StudentEntity>> getStudentForCourse();
}

class InsGradeRemoteDataSourceImpl extends InsGradeRemoteDataSource {
  @override
  Future<List<InsGradeEntity>> getGrade({required String studentId}) async {
    List<InsGradeEntity> gradeEntityList = [];
    await DioHelper.get(
      url: 'Instructor/GetGradesForCurrentCourseForAstudent?CycleId=$currentCycleId&studentId=$studentId',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        gradeEntityList= setGradeData(json);
      }
    });
    return gradeEntityList;
  }

    List<InsGradeEntity> setGradeData(
      List<dynamic> json) {
    List<InsGradeEntity> gradeEntityList = [];
    for (var element in json) {
      gradeEntityList.add(InsGradeModel.fromJson(element));
    }
  
    return gradeEntityList;
  }
  
  @override
  Future<List<StudentEntity>> getStudentForCourse() async {
    List<StudentEntity> students = [];
    await DioHelper.get(
      url: 'Instructor/GetAllStudentsEnrolledInAcourse?CycleId=$currentCycleId',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        print(currentCycleId);
        var json = value.data;
        students= fillAllStudentList(json);
      }
    });
    return students;
  }


    List<StudentEntity> fillAllStudentList(
      List<dynamic> json) {
    List<StudentEntity> gradeEntityList = [];
    for (var element in json) {
      gradeEntityList.add(StudentModel.fromJson(element));
    }
    gradeEntityList.forEach((v){
      print(v.studentName);
    });

    return gradeEntityList;
  }

}
