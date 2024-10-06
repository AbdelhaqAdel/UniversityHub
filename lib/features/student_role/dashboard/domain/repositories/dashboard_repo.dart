
import 'package:dartz/dartz.dart';
import 'package:universityhup/features/student_role/dashboard/domain/entities/dashboard_entity.dart';

import '../../../../../core/errors/failure.dart';


abstract class DashboardRepo{
  Future<Either<Failure,DashboardEntity>>  getDashboard();
}