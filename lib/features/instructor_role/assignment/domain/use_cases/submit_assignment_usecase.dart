
import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../../data/models/submit_assignment_input.dart';
import '../repositories/assignment_repo.dart';

class SubmitAssignmentInstructorUseCase extends UseCase<void,SubmitAssignmentInstructorInputModel>{
 final AssignmentInstructorRepo assignmentRepo;


 SubmitAssignmentInstructorUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, void>> call([SubmitAssignmentInstructorInputModel? submitAssignmentInstructorInputModel ]) {
  return assignmentRepo.submitAssignmentInstructor(submitAssignmentInstructorInputModel: submitAssignmentInstructorInputModel!);
  }

}
