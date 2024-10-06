import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/dashboard/domain/entities/dashboard_entity.dart';
import 'package:universityhup/features/instructor_role/dashboard/domain/use_cases/get_dashboard_usecase.dart';

import '../widgets/task_widget.dart';
part 'dashboard_state.dart';

class DashboardInstructorCubit extends Cubit<DashboardInstructorState> {
  DashboardInstructorCubit(
      {required this.getDashboardInstructorUseCase,})
      : super(DashboardInstructorInitial());

  static DashboardInstructorCubit get(context) => BlocProvider.of(context);
  final GetDashboardInstructorUseCase getDashboardInstructorUseCase;


  void getDashboardInstructor() async {
    emit(GetDashboardInstructorLoadingState());
    var result = await getDashboardInstructorUseCase.call();
    result.fold((failure) {
      print(failure.message);
      emit(GetDashboardInstructorErrorState(failure.toString()));
    }, (right) {
      GetDashboardInstructorSuccessState.dashboardData =
          right;
      GetDashboardInstructorSuccessState.setData();
      emit(GetDashboardInstructorSuccessState());
    });
  }

}
