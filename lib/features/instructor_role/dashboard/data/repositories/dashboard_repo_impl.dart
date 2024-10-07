
import 'package:dartz/dartz.dart';

import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/instructor_role/dashboard/data/data_sources/dashboard_remote_data_source.dart';
import 'package:universityhup/features/instructor_role/dashboard/domain/entities/dashboard_entity.dart';
import 'package:universityhup/features/instructor_role/dashboard/domain/repositories/dashboard_repo.dart';

import '../data_sources/dashboard_local_data_source.dart';



class DashboardInstructorRepoImpl extends DashboardInstructorRepo{
 final DashboardInstructorRemoteDataSource dashboardRemoteDataSource;
 final DashboardInstructorLocalDataSource dashboardInstructorLocalDataSource;


 DashboardInstructorRepoImpl({required this.dashboardInstructorLocalDataSource, required this.dashboardRemoteDataSource,});

  @override
  Future<Either<Failure, List<DashboardInstructorEntity>>> getDashboardInstructor() async {
    try{
      List<DashboardInstructorEntity> dashboardEntity=[] ;
       dashboardEntity = await dashboardRemoteDataSource.getDashboardInstructor();
      if(dashboardEntity.isEmpty){
        dashboardEntity =  dashboardInstructorLocalDataSource.getDashboardInstructor();
        return right(dashboardEntity);
      }
       return right(dashboardEntity);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  
}