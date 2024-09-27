
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../data/models/assignment_info_model.dart';
import '../../data/models/submit_assignment_input.dart';
import '../entities/assignment_entity.dart';

abstract class AssignmentInstructorRepo{
  Future<Either<Failure,List<AssignmentInstructorEntity>>>  getAssignmentInstructor();
  Future<Either<Failure,AssignmentInstructorInfoModel>>  getAssignmentInstructorInfo({required String assignmentId});
  Future<Either<Failure,void>>  submitAssignmentInstructor({required SubmitAssignmentInstructorInputModel submitAssignmentInstructorInputModel});
}