

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/student_role/dashboard/domain/entities/dashboard_entity.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});
  final DashboardTask task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10, bottom: 3, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Check Task'),
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
              FaIcon(
                FontAwesomeIcons.bookmark,
                size: 12,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                '${task.title}',
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
                FontAwesomeIcons.chartLine,
                size: 12,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                '${task.grade} points',
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
                'Deadline ${DateTime.parse(task.endDate!).day}/${DateTime.parse(task.endDate!).month}',
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
                'From ${DateTime.parse(task.startDate!).hour}/${DateTime.parse(task.endDate!).hour}',
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

