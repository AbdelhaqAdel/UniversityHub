import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/dashboard_entity.dart';
import '../repositories/dashboard_repo.dart';

class GetDashboardUseCase extends UseCase<
    ({
    List<DashboardTask> dashboardEntityTaskList,
    List<DashboardQuiz> dashboardEntityQuizList
    }),
    NoParam> {
 final DashboardRepo dashboardRepo;

 GetDashboardUseCase({required this.dashboardRepo});

 @override
 Future<
     Either<
         Failure,
         ({
         List<DashboardTask> dashboardEntityTaskList,
         List<DashboardQuiz> dashboardEntityQuizList
         })>> call([NoParam? param]) async {
  final result = await dashboardRepo.getDashboard();
  return result.fold(
       (failure) => Left(failure),
       (dashboardEntityList) {
    var filteredData = filterDashboardData(dashboardEntityList);
    return Right(filteredData);
   },
  );
 }

 ({
 List<DashboardTask> dashboardEntityTaskList,
 List<DashboardQuiz> dashboardEntityQuizList
 }) filterDashboardData(DashboardEntity dashboardEntityList) {
  List<DashboardTask> dashboardEntityTaskList = [];
  List<DashboardQuiz> dashboardEntityQuizList = [];
  for (var element in dashboardEntityList.tasks!) {
     dashboardEntityTaskList.add(element);
  }
  for (var element in dashboardEntityList.quizzes!) {
    dashboardEntityQuizList.add(element);
  }
  return (
  dashboardEntityTaskList: dashboardEntityTaskList,
  dashboardEntityQuizList: dashboardEntityQuizList
  );
 }
}
