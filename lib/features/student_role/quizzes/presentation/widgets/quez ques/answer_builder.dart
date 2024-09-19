import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/quiz_cubit.dart';
import 'answer_list_view.dart';

class AnswerBuilder extends StatelessWidget {
  const AnswerBuilder({
    required this.index,
    super.key});
    final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit,QuizState>(
      builder:(context,state){
        if(state is GetAllQuizDataSuccessState){
          return AnswerListView(questions:state.quizQues[index], 
          quizAnswers:state.quizAnswers, qIndex: index,);
        }
        else if(state is GetAllQuizDataErrorState){
          return Text(state.error);
        }
        else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }
      );
  }
}