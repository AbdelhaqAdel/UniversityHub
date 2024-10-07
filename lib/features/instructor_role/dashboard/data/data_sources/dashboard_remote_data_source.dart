
import 'package:universityhup/core/constants/hive_constants.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/functions/hive_function.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../models/dashboard_model.dart';



abstract class DashboardInstructorRemoteDataSource {
  Future<List<DashboardInstructorEntity>> getDashboardInstructor();

}

class DashboardInstructorRemoteDataSourceImpl extends DashboardInstructorRemoteDataSource {
  @override
  Future<List<DashboardInstructorEntity>> getDashboardInstructor() async {
    List<DashboardInstructorEntity> dashboardEntity=[];
    await DioHelper.get(
      url: 'InstructorDashboard/Get All Quiz&Task info',
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        dashboardEntity= setDashboardInstructorData(json);
        HiveService.saveListOfType<DashboardInstructorEntity>(
            dashboardEntity, HiveConstants.kDashboardINSBox);
      }
    }).catchError((onError){
      return null;
    });
    return dashboardEntity;
  }

  List<DashboardInstructorEntity> setDashboardInstructorData(
      List<dynamic> json) {
    List<DashboardInstructorEntity> dashboardEntity=[];
    for(var element in json){
      dashboardEntity.add(DashboardInstructorModel.fromJson(element));

    }
    return dashboardEntity;
  }


}
