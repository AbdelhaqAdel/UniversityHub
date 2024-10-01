
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/constants/constant.dart';
import '../../../domain/entities/quiz_entity.dart';
class PendingInfo extends StatelessWidget {

  const PendingInfo({
    super.key,
    required this.quizEntity,required this.startDate,required this.endDate,
  });

  final QuizInstructorEntity? quizEntity;
  final DateTime? startDate;
  final DateTime? endDate;
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
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.bookmark,
                  size: 12,
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Text(
                    currentCycleName!,
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
                  FontAwesomeIcons.user,
                  size: 12,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  'Start    ${startDate!.day} / ${startDate!.month}',
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
                  FontAwesomeIcons.clock,
                  size: 12,
                ),
                const SizedBox(
                  width: 7,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    'Deadline   ${endDate!.hour} : ${endDate!.minute}  ${endDate!.day} / ${endDate!.month}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
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
