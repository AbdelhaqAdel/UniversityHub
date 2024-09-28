import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../../data/models/set_grade_assignment_input.dart';
import '../repositories/assignment_repo.dart';

class SetGradeAssignmentUseCase extends UseCase<void,SetGradeAssignmentInputModel>{
 final AssignmentInstructorRepo assignmentRepo;


 SetGradeAssignmentUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, void>> call([SetGradeAssignmentInputModel? setGradeAssignmentInputModel ]) {
  return assignmentRepo.setGradeAssignment(setGradeAssignmentInputModel: setGradeAssignmentInputModel!);
  }

}
