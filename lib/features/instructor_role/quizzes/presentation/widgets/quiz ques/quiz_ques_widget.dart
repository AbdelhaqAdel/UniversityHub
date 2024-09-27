import 'package:flutter/material.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quiz%20ques/ques_widget.dart';

import '../../../data/models/question_data_model.dart';
import 'answer_builder.dart';

class QuizQuesWidget extends StatelessWidget {
  const QuizQuesWidget({
    required this.qIndex,
    required this.questions,
    super.key});
  final int qIndex;
  final Questions? questions;
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        QuesWidget(qIndex:qIndex, questions: questions,),
         SizedBox(height:MediaQuery.of(context).size.height/30),
          AnswerBuilder(index: qIndex),
      ],
    );
  }
}

