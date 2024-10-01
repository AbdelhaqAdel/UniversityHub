import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/pending_quiz_widget/header.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/pending_quiz_widget/info.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/pending_quiz_widget/states.dart';

import '../../domain/entities/quiz_entity.dart';


class PendingQuizInstructor extends StatelessWidget {
  final QuizInstructorEntity? quizEntity;

  const PendingQuizInstructor({
    super.key,
    required this.quizEntity,
  });
  

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
            PendingHeader(quizEntity: quizEntity),
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
                  PendingInfo(quizEntity: quizEntity, startDate: DateTime.parse(
                      quizEntity
                          !.endDate!), endDate: DateTime.parse(
                      quizEntity
                      !.endDate!),),
                  const PendingStates(),
                ],
              ),
            ),
            _LinearPercent(quizEntity: quizEntity),
          ],
        ),
      ),
    );
  }
}

class _LinearPercent extends StatelessWidget {
  const _LinearPercent({
    required this.quizEntity,
  });

  final QuizInstructorEntity? quizEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: LinearPercentIndicator(
        percent: quizEntity!.numberOfStudentsSolve! /
            quizEntity!.numberOfAllStudents!,
        backgroundColor: Colors.blueGrey.withOpacity(.2),
        progressColor: Colors.teal.withOpacity(.6),
        barRadius: const Radius.circular(20),
        lineHeight: 12,
        trailing: Text('${quizEntity!.numberOfAllStudents}'),
        leading: Text('${quizEntity!.numberOfStudentsSolve}'),

        animation: true,
        animationDuration: 1500,
        curve: Curves.easeOutBack,
      ),
    );
  }
}
