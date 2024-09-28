

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../../data/models/update_assignment_input.dart';
import '../repositories/assignment_repo.dart';

class UpdateAssignmentInstructorUseCase extends UseCase<void,UpdateAssignmentInstructorInputModel>{
 final AssignmentInstructorRepo assignmentRepo;


 UpdateAssignmentInstructorUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, void>> call([UpdateAssignmentInstructorInputModel? updateAssignmentInstructorInputModel ]) {
  return assignmentRepo.updateAssignmentInstructor(updateAssignmentInstructorInputModel: updateAssignmentInstructorInputModel!);
  }

}
