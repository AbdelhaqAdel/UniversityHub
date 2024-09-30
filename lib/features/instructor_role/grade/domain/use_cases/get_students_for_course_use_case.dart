
import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';
import 'package:universityhup/features/instructor_role/grade/domain/repositories/grade_repo.dart';

class GetStudentsForCourseUseCase extends UseCase<List<StudentEntity>,NoParam>{
 final InsGradeRepo gradeRepo;

 GetStudentsForCourseUseCase({required this.gradeRepo});
  @override
  Future<Either<Failure, List<StudentEntity>>> call([NoParam? param]) {
  return gradeRepo.getStudentForCourse();
  }

}
