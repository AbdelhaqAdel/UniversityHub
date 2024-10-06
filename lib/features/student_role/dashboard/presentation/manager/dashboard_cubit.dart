import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student_role/dashboard/presentation/widgets/quiz_widget.dart';

import '../../domain/entities/dashboard_entity.dart';
import '../../domain/use_cases/get_dashboard_usecase.dart';
import '../widgets/task_widget.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(
      {required this.getDashboardUseCase,})
      : super(DashboardInitial());

  static DashboardCubit get(context) => BlocProvider.of(context);
  final GetDashboardUseCase getDashboardUseCase;


  void getDashboard() async {
    emit(GetDashboardLoadingState());
    var result = await getDashboardUseCase.call();
    result.fold((failure) {
      emit(GetDashboardErrorState(failure.toString()));
    }, (right) {
      GetDashboardSuccessState.dashboardTask =
          right.dashboardEntityTaskList;
      GetDashboardSuccessState.dashboardQuiz =
          right.dashboardEntityQuizList;
      GetDashboardSuccessState.setData();

      emit(GetDashboardSuccessState());
    });
  }

}
