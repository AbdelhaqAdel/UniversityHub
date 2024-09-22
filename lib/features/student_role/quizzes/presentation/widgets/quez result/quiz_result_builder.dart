import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/manager/cubit/quiz_cubit.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quez%20result/quiz_result_widget.dart';

class QuizResultBuilder extends StatelessWidget {
   const QuizResultBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder <QuizCubit,QuizState>(builder:(context,state){
      if(SubmitQuizSuccessState.quizGrade!=null){
        return QuizResultWidget(quizGrade:SubmitQuizSuccessState.quizGrade!,);
        }else if(state is SubmitQuizErrorState){
       return Text(state.error); 
      }else {
        return const Center(child: CircularProgressIndicator(),);
      }
    });
  }
}

 