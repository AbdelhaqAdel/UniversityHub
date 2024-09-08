part of 'courses_cubit.dart';

sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}

class GetAllCoursesLoadingState extends CoursesState {}

class GetAllCoursesSuccessState extends CoursesState {
  static String currentCourseName='';
  static void setCourseName({required coursename}){
    currentCourseName=coursename;
  }
 final List<CoursesModel> courses;
  GetAllCoursesSuccessState({required this.courses});
}
class GetAllCoursesErrorState extends CoursesState {
  final String error;
  GetAllCoursesErrorState({required this.error});
}