import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../domain/entities/assignment_entity.dart';

class CompleteHeader extends StatelessWidget {
  const CompleteHeader({
    super.key,
    required this.assignmentEntity,
  });

  final AssignmentInstructorEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text('${assignmentEntity?.taskName}'),
        const Spacer(),
        const Center(
          child: FaIcon(
            FontAwesomeIcons.circleCheck,
            size: 25,
            color: Colors.teal,
          ),
        ),

      ],
    );
  }
}

