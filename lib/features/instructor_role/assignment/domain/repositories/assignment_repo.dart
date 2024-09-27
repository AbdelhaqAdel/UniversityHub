
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../data/models/update_assignment_input.dart';
import '../entities/assignment_entity.dart';

abstract class AssignmentInstructorRepo{
  Future<Either<Failure,List<AssignmentInstructorEntity>>>  getAssignmentInstructor();
  Future<Either<Failure,void>>  deleteAssignment({required String assignmentId});
  Future<Either<Failure,void>>  updateAssignmentInstructor({required UpdateAssignmentInstructorInputModel updateAssignmentInstructorInputModel});
}