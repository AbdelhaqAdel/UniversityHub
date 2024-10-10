import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import 'package:universityhup/features/calendar/presentation/pages/calender_screen.dart';
import 'package:universityhup/features/courses/presentation/pages/all_courses_screen.dart';
import 'package:universityhup/features/history/data/models/history_model.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../instructor_role/dashboard/presentation/pages/dashboard.dart';
import '../../../../instructor_role/user/presentation/pages/user_screen.dart';
import '../../../../news/presentation/pages/news_screen.dart';
import '../../../../student_role/dashboard/presentation/pages/dashboard.dart';
import '../../../../student_role/user/presentation/pages/user_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentNavigationBarIndex = 0;
  List<Widget> navigationBarScreens = [

    role=='Student'? const DashboardScreen():const DashboardInstructorScreen(),
    const NewsScreen(),
    const CoursesScreen(),
    const CalenderScreen(),
    role=='Student'? const UserScreen():const UserInstructorScreen(),
  ];

  void onTapNavigationBar(index) {
    currentNavigationBarIndex = index;
    emit(NavigationBarState());
  }
  List<HistoryModel> getStuHistoryData() {
    emit(GetStoryLoadingState());
    // Hive.box(HiveConstants.kHistory).clear();
   final Box stuHistoryBox = Hive.box(HiveConstants.kStuHistory);
    try {
     List<HistoryModel> stuHistoryModel = List.from(
          stuHistoryBox.get(HiveConstants.kStuHistory, defaultValue: [])).cast<HistoryModel>();
      emit(GetStorySuccessState());
      return stuHistoryModel;
    } catch (error) {
      emit(GetStoryErrorState());
      return [];
    }
  }

  void stuDeleteHistory({required int hisIndex,required context}) async {
        emit(DeleteHiStoryLoadingState());
       final Box stuHistoryBox = Hive.box(HiveConstants.kStuHistory);
    List<HistoryModel> stuHistoryModel = List.from(
          stuHistoryBox.get(HiveConstants.kStuHistory, defaultValue: [])).cast<HistoryModel>();
    stuHistoryModel.removeAt(hisIndex);
    await stuHistoryBox.put(HiveConstants.kStuHistory, stuHistoryModel)
        .then((value) {
      getStuHistoryData();
      showSnackBar(context: context, message: 'one item delete from your activity',);
      emit(DeleteHiStorySuccessState());
    }).catchError((error) {
      emit(DeleteHiStorySuccessState());
    });
  }


  
  List<HistoryModel> getInsHistoryData() {
    emit(GetStoryLoadingState());
    // Hive.box(HiveConstants.kHistory).clear();
   final Box insHistoryBox = Hive.box(HiveConstants.kInsHistory);
    try {
     List<HistoryModel> insHistoryModel = List.from(
          insHistoryBox.get(HiveConstants.kInsHistory, defaultValue: [])).cast<HistoryModel>();
      emit(GetStorySuccessState());
      return insHistoryModel;
    } catch (error) {
      emit(GetStoryErrorState());
      return [];
    }
  }

  void insDeleteHistory({required int hisIndex,required context}) async {
       final Box insHistoryBox = Hive.box(HiveConstants.kInsHistory);
    List<HistoryModel> insHistoryModel = List.from(
          insHistoryBox.get(HiveConstants.kInsHistory, defaultValue: [])).cast<HistoryModel>();
    emit(DeleteHiStoryLoadingState());
    insHistoryModel.removeAt(hisIndex);
    await insHistoryBox.put(HiveConstants.kInsHistory, insHistoryModel)
        .then((value) {
      getInsHistoryData();
      showSnackBar(context: context, message: 'one item delete from your activity',);
      emit(DeleteHiStorySuccessState());
    }).catchError((error) {
      emit(DeleteHiStorySuccessState());
    });
  }

}
