
import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../../data/models/submit_assignment_input.dart';
import '../repositories/assignment_repo.dart';

class SubmitAssignmentUseCase extends UseCase<void,SubmitAssignmentInputModel>{
 final AssignmentRepo assignmentRepo;


 SubmitAssignmentUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, void>> call([SubmitAssignmentInputModel? submitAssignmentInputModel ]) {
  return assignmentRepo.submitAssignment(submitAssignmentInputModel: submitAssignmentInputModel!);
  }

}
