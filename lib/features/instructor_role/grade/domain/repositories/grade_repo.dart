import 'package:dartz/dartz.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/grade_entity.dart';


abstract class InsGradeRepo{
  Future<Either<Failure, List<StudentEntity>>>  getStudentForCourse();
  Future<Either<Failure,List<InsGradeEntity>>>  getGrade({required String studentId});
}