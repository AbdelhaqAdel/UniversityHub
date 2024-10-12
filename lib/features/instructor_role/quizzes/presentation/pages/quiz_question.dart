import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import '../manager/quiz_cubit.dart';
import '../manager/quiz_state.dart';
import '../widgets/add_quiz/question/question_action.dart';
import '../widgets/add_quiz/question/question_item.dart';
import '../widgets/add_quiz/question/question_listview.dart';

class QuizQuestion extends StatefulWidget {
 const QuizQuestion({super.key, required this.cubit});
 final QuizInstructorCubit cubit ;

  @override
  State<QuizQuestion> createState() => _QuizQuestion();
}

class _QuizQuestion extends State<QuizQuestion> {
  _QuizQuestion();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocConsumer<QuizInstructorCubit, QuizInstructorState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        QuizInstructorCubit cubit = QuizInstructorCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                QuestionListView(cubit: cubit),
                QuestionAction(cubit: cubit),
              ],
            ),
          ),
        );
      },
    ),
);
  }




}




