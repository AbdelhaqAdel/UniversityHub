import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/add_quiz/question/points.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/add_quiz/question/question_field.dart';

import '../../../manager/quiz_cubit.dart';
import 'answer_listview.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem(
      {super.key,
      required this.index,
      required this.animation,
      required this.cubit});
  final int index;
  final Animation<double> animation;
  final QuizInstructorCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Question',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${index + 1}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          QuestionField(cubit: cubit, index: index),
          const SizedBox(height: 15.0),
          AnswerListVew(index: index, cubit: cubit),
          const SizedBox(
            height: 5,
          ),
          Points(cubit: cubit, index: index),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 1,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
