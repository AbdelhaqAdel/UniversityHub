import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../repositories/assignment_repo.dart';

class DeleteAssignmentUseCase extends UseCase<void,String>{
 final AssignmentInstructorRepo assignmentRepo;

 DeleteAssignmentUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, void>> call([String? assignmentId]) {
  return assignmentRepo.deleteAssignment(assignmentId: assignmentId!);
  }

}
