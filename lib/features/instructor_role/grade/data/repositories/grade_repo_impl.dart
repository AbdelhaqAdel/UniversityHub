import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/instructor_role/grade/data/data_sources/grade_remote_data_source.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/grade_entity.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';
import 'package:universityhup/features/instructor_role/grade/domain/repositories/grade_repo.dart';

class InsGradeRepoImpl extends InsGradeRepo{
 final InsGradeRemoteDataSource gradeRemoteDataSource;


 InsGradeRepoImpl( {required this.gradeRemoteDataSource,});

  @override
  Future<Either<Failure, List<InsGradeEntity>>> getGrade({required String studentId}) async {
    try{
      List<InsGradeEntity> gradeEntityList = [];
      gradeEntityList = await gradeRemoteDataSource.getGrade(studentId:studentId);
       return right(gradeEntityList);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StudentEntity>>> getStudentForCourse() async{
     try{
      List<StudentEntity> students = [];
      students = await gradeRemoteDataSource.getStudentForCourse();
       return right(students);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}