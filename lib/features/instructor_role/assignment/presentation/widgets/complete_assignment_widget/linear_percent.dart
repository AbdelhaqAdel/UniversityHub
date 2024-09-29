

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../domain/entities/assignment_entity.dart';

class LinearPercent extends StatelessWidget {
  const LinearPercent({
    super.key,
    required this.assignmentEntity,
  });

  final AssignmentInstructorEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: LinearPercentIndicator(
        percent: assignmentEntity!.numberOfStudentsUploads! /
            assignmentEntity!.numberOfAllStudents!,
        backgroundColor: Colors.blueGrey.withOpacity(.2),
        progressColor: Colors.teal.withOpacity(.6),
        barRadius: const Radius.circular(20),
        lineHeight: 12,
        trailing: Text('${assignmentEntity!.numberOfAllStudents}'),
        leading: Text('${assignmentEntity!.numberOfStudentsUploads}'),

        animation: true,
        animationDuration: 1500,
        curve: Curves.easeOutBack,
      ),
    );
  }
}