import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../../data/models/set_grade_assignment_input.dart';
import '../entities/student_task_uploaded_entity.dart';
import '../repositories/assignment_repo.dart';

class GetStudentSubmitAssignmentUsecase extends UseCase<List<StudentTaskUploadedEntity>,String>{
 final AssignmentInstructorRepo assignmentRepo;


 GetStudentSubmitAssignmentUsecase({required this.assignmentRepo});
  @override
  Future<Either<Failure, List<StudentTaskUploadedEntity>>> call([String? assignmentId ]) {
  return assignmentRepo.getStudentSubmitAssignment(assignmentId: assignmentId!);
  }

}
