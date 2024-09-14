
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/courses/presentation/pages/all_courses_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentNavigationBarIndex = 0;
  List<Widget> navigationBarScreens = [

    const CoursesScreen(),
    const CoursesScreen(),
    const CoursesScreen(),
    const CoursesScreen(),
    const CoursesScreen(),
  ];
  void onTapNavigationBar(index) {
    currentNavigationBarIndex = index;
    emit(NavigationBarState());
  }
}
