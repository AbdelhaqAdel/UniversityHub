
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../repositories/assignment_repo.dart';

class SubmitAssignmentUseCase extends UseCase<void,String>{
 final AssignmentRepo assignmentRepo;


 SubmitAssignmentUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, void>> call([String? assignmentId]) {
  return assignmentRepo.submitAssignment(assignmentId: assignmentId!);
  }

}
