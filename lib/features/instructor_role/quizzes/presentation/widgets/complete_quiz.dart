import 'package:flutter/material.dart';

import '../../domain/entities/quiz_entity.dart';
import 'complete_quiz_widget/complete_header.dart';
import 'complete_quiz_widget/info.dart';
import 'complete_quiz_widget/linear_percent.dart';
import 'complete_quiz_widget/states.dart';

class CompleteQuizInstructor extends StatelessWidget {
  const CompleteQuizInstructor({
    super.key, required this.quizEntity, required this.startDate,required this.endDate,
  });
  final QuizInstructorEntity? quizEntity;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .5),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left: 15),
        child: Column(
          children: [
            CompleteHeader(quizEntity: quizEntity),
            const SizedBox(
              height: 7,
            ),
            Container(
              color: Colors.black.withOpacity(.3),
              height: .5,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  CompeteQuizInfo(startDate: startDate, endDate: endDate),
                  const CompleteQuizStates(),
                ],
              ),
            ),
            LinearPercent(quizEntity: quizEntity),
          ],
        ),
      ),
    );
  }
}







