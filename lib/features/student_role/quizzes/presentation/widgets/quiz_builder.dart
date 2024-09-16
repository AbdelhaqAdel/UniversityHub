import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quiz_list_view.dart';

import '../manager/cubit/quiz_cubit.dart';

class QuizBuilder extends StatelessWidget {
  const QuizBuilder({
    super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit,QuizState>(
      builder:(context,state){
        if(state is GetAllQuizzesSuccessState){
          return QuizzesListView(quiz: state.quizzes,context1: context,);
        }
        else if(state is GetAllQuizzesErrorState){
          return Text(state.error);
        }
        else{
          return const Center(child: CircularProgressIndicator(),);
        }
      }
      );
  }
}