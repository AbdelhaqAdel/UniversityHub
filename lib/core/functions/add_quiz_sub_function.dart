import 'package:flutter/cupertino.dart';

import '../../features/instructor_role/quizzes/presentation/manager/quiz_cubit.dart';
import '../../features/instructor_role/quizzes/presentation/widgets/add_quiz/question/question_item.dart';
import '../../features/instructor_role/quizzes/presentation/widgets/add_quiz/question/question_listview.dart';

void addQuestion({required QuizInstructorCubit cubit}) {
  cubit.answerListController.insert(cubit.questionListController.length, [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ]);

  cubit.answerCheck.insert(cubit.questionListController.length, [
    true,
    false,
    false,
    false,
  ]);

  cubit.questionListController.insert(cubit.questionListController.length, TextEditingController());

  cubit.gradeListController.insert(cubit.gradeListController.length, TextEditingController());

  listKey.currentState!.insertItem(cubit.questionListController.length - 1);
}

void removeLastQuestion({required QuizInstructorCubit cubit}) {
  if (cubit.questionListController.length != 1) {
    cubit.questionListController.removeAt(cubit.questionListController.length - 1);
    cubit.gradeListController.removeAt(cubit.gradeListController.length - 1);
    listKey.currentState!.removeItem(
      cubit.questionListController.length - 1,
          (BuildContext context, Animation<double> animation) => QuestionItem(
        index: cubit.questionListController.length - 1,
        animation: animation,
        cubit: cubit,
      ),
      duration: const Duration(milliseconds: 250),
    );

    cubit.answerListController.removeAt(cubit.answerListController.length - 1);

    cubit.answerCheck.removeAt(cubit.answerCheck.length - 1);
  }
}