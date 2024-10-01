

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../domain/entities/quiz_entity.dart';

class LinearPercent extends StatelessWidget {
  const LinearPercent({
    super.key,
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