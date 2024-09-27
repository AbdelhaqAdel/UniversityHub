
import 'package:dartz/dartz.dart';

import 'package:universityhup/core/errors/failure.dart';

import '../../domain/entities/grade_entity.dart';
import '../../domain/repositories/grade_repo.dart';
import '../data_sources/grade_remote_data_source.dart';

class GradeRepoImpl extends GradeRepo{
 final GradeRemoteDataSource gradeRemoteDataSource;


 GradeRepoImpl( {required this.gradeRemoteDataSource,});

  @override
  Future<Either<Failure, List<GradeEntity>>> getGrade() async {
    try{
      List<GradeEntity> gradeEntityList = [];
      gradeEntityList = await gradeRemoteDataSource.getGrade();
       return right(gradeEntityList);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}