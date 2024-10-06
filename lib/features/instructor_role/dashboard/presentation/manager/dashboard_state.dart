part of 'dashboard_cubit.dart';


sealed class DashboardInstructorState {}

final class DashboardInstructorInitial extends DashboardInstructorState {}

class GetDashboardInstructorLoadingState extends DashboardInstructorState{}
class GetDashboardInstructorSuccessState extends DashboardInstructorState{
  static  List<DashboardInstructorEntity>  dashboardData=[];
  static  List<Widget>dashboardWidget=[];
  static setData(){
    dashboardWidget=[];
    for (var element in dashboardData) {
      dashboardWidget.add(TaskWidget(task: element));
    }
  }

  GetDashboardInstructorSuccessState();
}
class GetDashboardInstructorErrorState extends DashboardInstructorState{
  final String errMessage;
  GetDashboardInstructorErrorState(this.errMessage);
}

