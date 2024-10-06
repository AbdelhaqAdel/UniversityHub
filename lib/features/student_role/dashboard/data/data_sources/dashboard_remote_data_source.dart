
import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../models/dashboard_model.dart';



abstract class DashboardRemoteDataSource {
  Future<DashboardEntity> getDashboard();

}

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
  @override
  Future<DashboardEntity> getDashboard() async {
    DashboardEntity? dashboardEntity;
    await DioHelper.get(
      url: 'StudentDashboard/GetUnsubmittedQuizzesAndTasks',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        dashboardEntity= setDashboardData(json);
      }
    });
    return dashboardEntity!;
  }

  DashboardEntity setDashboardData(
      Map<String, dynamic> json) {
    DashboardEntity? dashboardEntity;
      dashboardEntity=DashboardModel.fromJson(json);
    return dashboardEntity;
  }


}
