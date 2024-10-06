
import 'package:dartz/dartz.dart';

import 'package:universityhup/core/errors/failure.dart';

import '../../domain/entities/dashboard_entity.dart';
import '../../domain/repositories/dashboard_repo.dart';
import '../data_sources/dashboard_remote_data_source.dart';


class DashboardRepoImpl extends DashboardRepo{
 final DashboardRemoteDataSource dashboardRemoteDataSource;


 DashboardRepoImpl( {required this.dashboardRemoteDataSource,});

  @override
  Future<Either<Failure, DashboardEntity>> getDashboard() async {
    try{
      DashboardEntity dashboardEntity ;
       dashboardEntity = await dashboardRemoteDataSource.getDashboard();
       return right(dashboardEntity);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  
}