import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/manager/grade_cubit.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/manager/grade_state.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/stu%20grade%20widgets/grade_table_widget.dart';

class AllStudentsBuilder extends StatelessWidget {
  const AllStudentsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<InsGradeCubit,InsGradeState>(
      builder:(context,state){
        if (state is GetGradeSuccessState){
          return GradeTableWidget(stuGrades: state.gradeEntity,);
        }
        else if(state is GetGradeErrorState){
          return Text(state.errMessage);
        }
        else if(state is GetGradeLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        else{
          return const Text('no grades for this student');
        }
      }
      );
  }
}