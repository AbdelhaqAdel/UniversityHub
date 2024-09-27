
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/entities/assignment_entity.dart';
class PendingInfo extends StatelessWidget {
  const PendingInfo({
    super.key,
    required this.assignmentEntity,
  });

  final AssignmentEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.user,
                  size: 12,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  '${assignmentEntity?.taskGrade}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.chartLine,
                  size: 12,
                ),
                const SizedBox(
                  width: 7,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    'From ${assignmentEntity?.startDate}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.clock,
                  size: 12,
                ),
                const SizedBox(
                  width: 7,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    'to  ${assignmentEntity?.endDate}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
