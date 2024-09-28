

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../../data/models/add_assignment_input.dart';
import '../repositories/assignment_repo.dart';


class AddAssignmentUseCase extends UseCase<void,AddAssignmentInputModel>{
 final AssignmentInstructorRepo assignmentRepo;


 AddAssignmentUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, void>> call([AddAssignmentInputModel? addAssignmentInputModel ]) {
  return assignmentRepo.addAssignment(addAssignmentInputModel: addAssignmentInputModel!);
  }

}
