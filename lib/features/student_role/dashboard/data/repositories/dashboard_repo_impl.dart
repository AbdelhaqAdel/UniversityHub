
import 'package:dartz/dartz.dart';

import 'package:universityhup/core/errors/failure.dart';

import '../../domain/entities/dashboard_entity.dart';
import '../../domain/repositories/dashboard_repo.dart';
import '../data_sources/dashboard_local_data_source.dart';
import '../data_sources/dashboard_remote_data_source.dart';


class DashboardRepoImpl extends DashboardRepo{
 final DashboardRemoteDataSource dashboardRemoteDataSource;
 final DashboardLocalDataSource dashboardLocalDataSource;


 DashboardRepoImpl({required this.dashboardLocalDataSource,required this.dashboardRemoteDataSource,});

  @override
  Future<Either<Failure, DashboardEntity?>> getDashboard() async {
    try{
      DashboardEntity? dashboardEntity ;
       dashboardEntity = await dashboardRemoteDataSource.getDashboard();
        dashboardEntity ??=  dashboardLocalDataSource.getDashboardSTU();
       return right(dashboardEntity!);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  
}