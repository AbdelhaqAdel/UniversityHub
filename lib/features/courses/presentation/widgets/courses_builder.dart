import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';
import 'package:universityhup/features/courses/presentation/manager/cubit/courses_cubit.dart';
import 'package:universityhup/features/courses/presentation/widgets/courses_list_view.dart';

class CoursesBuilder extends StatelessWidget {
  const CoursesBuilder({
    super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit,CoursesState>(
      builder:(context,state){
        if(state is GetAllCoursesSuccessState){
          return CoursesListView(courses: state.courses,);
        }
        else if(state is GetAllCoursesErrorState){
          return Text(state.error);
        }
        else if(state is GetAllCoursesLoadingState){
          if(Hive.box<CoursesModel>(HiveConstants.coursesBox).values.toList().isNotEmpty){
          return CoursesListView(courses: Hive.box<CoursesModel>(HiveConstants.coursesBox).values.toList(),);
          }
          return const Center(child: CircularProgressIndicator(),);
        }
        else{
          return const Center(child: Text('No Enrollments Found'),);
        }
      }
      );
  }
}