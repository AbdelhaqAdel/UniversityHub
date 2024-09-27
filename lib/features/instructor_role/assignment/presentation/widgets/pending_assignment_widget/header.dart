
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/entities/assignment_entity.dart';

class PendingHeader extends StatelessWidget {
  const PendingHeader({
    super.key,
    required this.assignmentEntity,
  });

  final AssignmentEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text('${assignmentEntity?.taskName}'),
        const Spacer(),
        SizedBox(
          height: 30,
          width: 30,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.circleUp,
              size: 26,
              color: Colors.teal.withOpacity(.7),
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.circleDown,
              size: 26,
              color: Colors.teal.withOpacity(.7),
            ),
          ),
        ),
      ],
    );
  }
}
