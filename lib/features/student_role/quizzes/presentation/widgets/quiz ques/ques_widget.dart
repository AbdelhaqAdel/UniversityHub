import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/question_data_model.dart';

class QuesWidget extends StatelessWidget {
  const QuesWidget({
     required this.qIndex,
    required this.questions,
    super.key});
     final int qIndex;
  final Questions? questions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Question',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${qIndex + 1}',
              style:  Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.blue
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.all(15),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  FontAwesomeIcons.circleInfo,
                  size: 22,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    '${questions?.text}',
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}