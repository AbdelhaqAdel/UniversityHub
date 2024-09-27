
import 'package:dartz/dartz.dart';

import 'package:universityhup/core/errors/failure.dart';

import '../../domain/entities/assignment_entity.dart';
import '../../domain/repositories/assignment_repo.dart';
import '../data_sources/assignment_remote_data_source.dart';
import '../models/assignment_info_model.dart';
import '../models/submit_assignment_input.dart';

class AssignmentRepoImpl extends AssignmentRepo{
 final AssignmentRemoteDataSource assignmentRemoteDataSource;


 AssignmentRepoImpl( {required this.assignmentRemoteDataSource,});

  @override
  Future<Either<Failure, List<AssignmentEntity>>> getAssignment() async {
    try{
      List<AssignmentEntity> assignmentEntityList = [];
       assignmentEntityList = await assignmentRemoteDataSource.getAssignment();
       return right(assignmentEntityList);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AssignmentInfoModel>> getAssignmentInfo({required String assignmentId}) async {
    try{
      AssignmentInfoModel? assignmentInfoModel ;
      assignmentInfoModel = await assignmentRemoteDataSource.getAssignmentInfo(assignmentId: assignmentId);
      return right(assignmentInfoModel!);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> submitAssignment({required SubmitAssignmentInputModel submitAssignmentInputModel}) async {
    try{
      await assignmentRemoteDataSource.submitAssignment(submitAssignmentInputModel: submitAssignmentInputModel);
      return right(null);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}