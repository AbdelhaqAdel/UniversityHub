part of 'layout_cubit.dart';


abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class NavigationBarState extends LayoutState {}
class GetStoryLoadingState extends LayoutState {}
class GetStorySuccessState extends LayoutState {}
class GetStoryErrorState extends LayoutState {}

class DeleteHiStoryLoadingState extends LayoutState {}
class DeleteHiStorySuccessState extends LayoutState {}
class DeleteHiStoryErrorState extends LayoutState {}
