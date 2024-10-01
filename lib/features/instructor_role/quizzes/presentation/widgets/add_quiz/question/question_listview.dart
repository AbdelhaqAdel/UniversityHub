import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/add_quiz/question/question_item.dart';

import '../../../manager/quiz_cubit.dart';

final GlobalKey<AnimatedListState> listKey = GlobalKey();

class QuestionListView extends StatelessWidget {
  const QuestionListView({
    super.key,
    required this.cubit,
  });

  final QuizInstructorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        physics: const BouncingScrollPhysics(),
        key: listKey,
        initialItemCount: cubit.questionListController.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) =>
                Padding(
          padding: const EdgeInsets.all(15.0),
          child: QuestionItem(
            index: index,
            animation: animation,
            cubit: cubit,
          ),
        ),
      ),
    );
  }
}
