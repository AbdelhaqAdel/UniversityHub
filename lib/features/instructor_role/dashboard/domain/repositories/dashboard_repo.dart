
import 'package:dartz/dartz.dart';
import 'package:universityhup/features/instructor_role/dashboard/domain/entities/dashboard_entity.dart';

import '../../../../../core/errors/failure.dart';


abstract class DashboardInstructorRepo{
  Future<Either<Failure,List<DashboardInstructorEntity>>>  getDashboardInstructor();
}