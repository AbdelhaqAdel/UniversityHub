

import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';

import '../../domain/entities/dashboard_entity.dart';


abstract class DashboardLocalDataSource {
  DashboardEntity? getDashboardSTU();
}

class DashboardLocalDataSourceImpl extends DashboardLocalDataSource {
  @override
  DashboardEntity? getDashboardSTU() {
    DashboardEntity? dashboardEntity ;
    var box = Hive.box<DashboardEntity>(HiveConstants.kDashboardSTUBox);
    dashboardEntity = box.get('dashboardEntity');
    return dashboardEntity;
  }
}
