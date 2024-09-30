import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/manager/grade_cubit.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/manager/grade_state.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/all%20students%20widgets/all_students_list_view.dart';

class AllStudentsBuilder extends StatelessWidget {
  const AllStudentsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<InsGradeCubit,InsGradeState>(
      builder:(context,state){
        if(GetStudentForCourseSuccessState.allStudents.isNotEmpty){
          return AllStudentsListView(students: GetStudentForCourseSuccessState.allStudents, cubitContext: context, 
          studentGrades: [], totalGrade: GetGradeSuccessState.totalGrade,);
        }
        else if(state is GetStudentForCourseErrorState){
          return Text(state.errMessage);
        }
        else if(state is GetStudentForCourseLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        else{
          return const Text('no students for this course');
        }
      }
      );
  }
}