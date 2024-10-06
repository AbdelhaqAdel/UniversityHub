

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/student_role/dashboard/domain/entities/dashboard_entity.dart';


class QuizWidget extends StatelessWidget {
  const QuizWidget({super.key, required this.quiz});
  final DashboardQuiz quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10, bottom: 3, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Check Quiz'),
          const SizedBox(
            height: 7,
          ),
          Container(
            color: Colors.black.withOpacity(.3),
            height: 1.5,
          ),
          const Spacer(),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.bookmark,
                size: 12,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                '${quiz.title}',
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
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
              Text(
                '${quiz.grade} points',
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
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
              Text(
                'Deadline ${DateTime.parse(quiz.endDate!).day}/${DateTime.parse(quiz.endDate!).month}',
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
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
              Text(
                'From ${DateTime.parse(quiz.startDate!).day}/${DateTime.parse(quiz.endDate!).month}',
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
