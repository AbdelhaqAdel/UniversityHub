import 'package:dartz/dartz.dart';
import 'package:universityhup/features/instructor_role/dashboard/domain/entities/dashboard_entity.dart';
import 'package:universityhup/features/instructor_role/dashboard/domain/repositories/dashboard_repo.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';

class GetDashboardInstructorUseCase extends UseCase<
    List<DashboardInstructorEntity>,
    NoParam> {
  final DashboardInstructorRepo dashboardRepo;

  GetDashboardInstructorUseCase({required this.dashboardRepo});

  @override
  Future<
      Either<
          Failure,
          List<DashboardInstructorEntity>>> call([NoParam? param]) async {
    return await dashboardRepo.getDashboardInstructor();
  }

}
