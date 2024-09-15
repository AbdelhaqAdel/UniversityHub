import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student/quizzes/presentation/manager/cubit/quiz_cubit.dart';
import 'package:universityhup/features/student/quizzes/presentation/widgets/quez%20ques/quiz_page_view.dart';

class QuesBuilder extends StatelessWidget {
  const QuesBuilder({
    required this.islast,
    required this.isStart,
    required this.boardController,
    super.key});
        final bool islast;
    final bool isStart;
    final PageController boardController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit,QuizState>(
      builder:(context,state){
        if(state is GetAllQuizDataSuccessState){
          return QuizPageView(ques:state.quizzes, 
          islast: islast, isStart: isStart, boardcontroller: boardController,);
        }
        else if(state is GetAllQuizDataErrorState){
          return Text(state.error);
        }
        else{
          return const Center(child: CircularProgressIndicator(),);
        }
      }
      );
  }
}