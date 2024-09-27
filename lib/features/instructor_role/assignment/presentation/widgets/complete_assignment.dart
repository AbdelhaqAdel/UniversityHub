import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/entities/assignment_entity.dart';
import 'complete_assignment_widget/info.dart';
import 'complete_assignment_widget/states.dart';

class CompleteAssignmentInstructor extends StatelessWidget {
  final AssignmentInstructorEntity? assignmentEntity;
  const CompleteAssignmentInstructor({
    super.key, required this.assignmentEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      decoration: BoxDecoration(
        // color: Colors.blueGrey.withOpacity(.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .5),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left: 15),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text('${assignmentEntity?.taskName}'),
                const Spacer(),
                const SizedBox(
                  width: 7,
                ),
                InkWell(
                  onTap: () {
    
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: 26,
                        color: Colors.teal.withOpacity(.7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                  CompleteAssignmentInstructorInfo(assignmentEntity: assignmentEntity),
                  const CompleteAssignmentInstructorStates(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

