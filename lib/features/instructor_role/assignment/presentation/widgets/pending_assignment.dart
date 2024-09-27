import 'package:flutter/material.dart';
import 'package:universityhup/features/student_role/assignment/presentation/widgets/pending_assignment_widget/header.dart';
import 'package:universityhup/features/student_role/assignment/presentation/widgets/pending_assignment_widget/info.dart';
import 'package:universityhup/features/student_role/assignment/presentation/widgets/pending_assignment_widget/states.dart';
import 'package:universityhup/features/student_role/assignment/presentation/widgets/pending_assignment_widget/upload_download.dart';

import '../../domain/entities/assignment_entity.dart';


class PendingAssignmentInstructor extends StatelessWidget {
  final AssignmentInstructorEntity? assignmentEntity;
  const PendingAssignmentInstructor({
    super.key,
    required this.assignmentEntity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),

      onTap: () {
        showDialog<String>(
          context: context,
          barrierColor: Colors.black.withOpacity(.3),
          useSafeArea: true,
          builder: (BuildContext context) => UploadAndDownload(assignmentEntity: assignmentEntity),
        );
      },
      child: Container(
        height: 155,
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
                    PendingInfo(assignmentEntity: assignmentEntity),
                    const PendingStates(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

