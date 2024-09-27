import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:universityhup/features/student_role/assignment/domain/entities/assignment_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/assignment_info_model.dart';
import '../../data/models/submit_assignment_input.dart';

abstract class AssignmentRepo{
  Future<Either<Failure,List<AssignmentEntity>>>  getAssignment();
  Future<Either<Failure,AssignmentInfoModel>>  getAssignmentInfo({required String assignmentId});
  Future<Either<Failure,void>>  submitAssignment({required SubmitAssignmentInputModel submitAssignmentInputModel});
}