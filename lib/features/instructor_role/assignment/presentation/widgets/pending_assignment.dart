import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:universityhup/features/instructor_role/assignment/domain/entities/assignment_entity.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/header.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/info.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/states.dart';
import '../../../../../core/constants/constant.dart';

class PendingAssignmentInstructor extends StatelessWidget {
  final AssignmentInstructorEntity? assignmentEntity;
  const PendingAssignmentInstructor({
    super.key,
    required this.assignmentEntity,
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
            PendingHeader(assignmentEntity: assignmentEntity),
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
                  PendingInfo(assignmentEntity: assignmentEntity,),
                  const PendingStates(),
                ],
              ),
            ),
            _LinearPercent(assignmentEntity: assignmentEntity),
          ],
        ),
      ),
    );
  }
}

class _LinearPercent extends StatelessWidget {
  const _LinearPercent({
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
