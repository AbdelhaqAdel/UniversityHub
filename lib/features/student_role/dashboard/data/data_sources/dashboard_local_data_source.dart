

import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';

import '../../domain/entities/dashboard_entity.dart';


abstract class DashboardLocalDataSource {
  DashboardEntity? getDashboardInstructor();
}

class DashboardLocalDataSourceImpl extends DashboardLocalDataSource {
  @override
  DashboardEntity? getDashboardInstructor() {
    DashboardEntity? dashboardEntity ;
    var box = Hive.box<DashboardEntity>(HiveConstants.kDashboardINSBox);
    dashboardEntity = box.get('dashboardEntity');
    return dashboardEntity;
  }
}
