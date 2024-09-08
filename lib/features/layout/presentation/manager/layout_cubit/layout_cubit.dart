
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/test/presentation/pages/test.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentNavigationBarIndex = 0;
  List<Widget> navigationBarScreens = [
    const test(),
    const test(),
    const test(),
    const test(),
    const test(),
  ];
  void onTapNavigationBar(index) {
    currentNavigationBarIndex = index;
    emit(NavigationBarState());
  }
}
