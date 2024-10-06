part of 'dashboard_cubit.dart';


sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

class GetDashboardLoadingState extends DashboardState{}
class GetDashboardSuccessState extends DashboardState{
  static  List<DashboardTask>  dashboardTask=[];
  static List<DashboardQuiz>  dashboardQuiz=[];
  static List<Widget>  dashboardWidget=[];
  static setData(){
    dashboardWidget=[];
    for (var element in dashboardTask) {
      dashboardWidget.add(TaskWidget(task: element));
    }
    for (var element in dashboardQuiz) {
      dashboardWidget.add(QuizWidget(quiz: element));
    }
  }

  GetDashboardSuccessState();
}
class GetDashboardErrorState extends DashboardState{
  final String errMessage;
  GetDashboardErrorState(this.errMessage);
}

