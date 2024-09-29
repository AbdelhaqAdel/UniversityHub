import 'package:flutter/material.dart';

import '../../domain/entities/assignment_entity.dart';
import 'complete_assignment_widget/complete_header.dart';
import 'complete_assignment_widget/info.dart';
import 'complete_assignment_widget/linear_percent.dart';
import 'complete_assignment_widget/states.dart';

class CompleteAssignmentInstructor extends StatelessWidget {
  const CompleteAssignmentInstructor({
    super.key, required this.assignmentEntity, required this.startDate,required this.endDate,
  });
  final AssignmentInstructorEntity? assignmentEntity;
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
            CompleteHeader(assignmentEntity: assignmentEntity),
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
                  CompeteTaskInfo(startDate: startDate, endDate: endDate),
                  const CompleteTaskStates(),
                ],
              ),
            ),
            LinearPercent(assignmentEntity: assignmentEntity),
          ],
        ),
      ),
    );
  }
}







