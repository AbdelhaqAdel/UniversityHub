

import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';

import '../../domain/entities/dashboard_entity.dart';

abstract class DashboardInstructorLocalDataSource {
  List<DashboardInstructorEntity> getDashboardInstructor();
}

class DashboardInstructorLocalDataSourceImpl extends DashboardInstructorLocalDataSource {
  @override
  List<DashboardInstructorEntity> getDashboardInstructor() {
    List<DashboardInstructorEntity> dashboardInstructorEntity = [];
    var box = Hive.box<DashboardInstructorEntity>(HiveConstants.kDashboardINSBox);
    dashboardInstructorEntity = box.values.toList();
    return dashboardInstructorEntity;
  }
}
