
import 'package:dartz/dartz.dart';

import 'package:universityhup/core/errors/failure.dart';

import '../../domain/entities/assignment_entity.dart';
import '../../domain/repositories/assignment_repo.dart';
import '../data_sources/assignment_remote_data_source.dart';
import '../models/assignment_info_model.dart';
import '../models/update_assignment_input.dart';

class AssignmentInstructorRepoImpl extends AssignmentInstructorRepo{
 final AssignmentInstructorRemoteDataSource assignmentRemoteDataSource;


 AssignmentInstructorRepoImpl( {required this.assignmentRemoteDataSource,});

  @override
  Future<Either<Failure, List<AssignmentInstructorEntity>>> getAssignmentInstructor() async {
    try{
      List<AssignmentInstructorEntity> assignmentEntityList = [];
       assignmentEntityList = await assignmentRemoteDataSource.getAssignmentInstructor();
       return right(assignmentEntityList);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAssignment({required String assignmentId}) async {
    try{
      await assignmentRemoteDataSource.deleteAssignment(assignmentId: assignmentId);
      return right(null);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAssignmentInstructor({required UpdateAssignmentInstructorInputModel updateAssignmentInstructorInputModel}) async {
    try{
      await assignmentRemoteDataSource.updateAssignment(updateAssignmentInstructorInputModel: updateAssignmentInstructorInputModel);
      return right(null);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}