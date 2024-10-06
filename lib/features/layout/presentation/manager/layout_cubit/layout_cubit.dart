import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/calendar/presentation/pages/calender_screen.dart';
import 'package:universityhup/features/courses/presentation/pages/all_courses_screen.dart';

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
}
