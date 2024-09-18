import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quez%20ques/quiz_page_view.dart';
import '../../manager/cubit/quiz_cubit.dart';

class QuesBuilder extends StatelessWidget {
  const QuesBuilder({
    required this.isLast,
    required this.isStart,
    required this.boardController,
    required this.onPageChanged,
    super.key});
        final bool isLast;
    final bool isStart;
    final PageController boardController;
    final Function(int) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit,QuizState>(
      builder:(context,state){
        if(state is GetAllQuizDataSuccessState){
          return QuizPageView(ques:state.quizQues, onPageChanged: onPageChanged,
          boardController: boardController,);
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