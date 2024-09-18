import 'package:flutter/material.dart';
import 'package:universityhup/core/style/colors.dart';

import '../../../data/models/question_data_model.dart';
import '../../manager/cubit/quiz_cubit.dart';

class AnswerListView extends StatelessWidget {
  const AnswerListView({
    required this.questions,
    required this.quizAnswers,
    required this.qIndex,
    super.key});
      final Questions? questions;
      final List<String> quizAnswers;
      final int qIndex;
  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
          shrinkWrap: true,
          itemCount: questions?.answers?.length,
          itemBuilder: (context, index) {
            return RadioListTile(
              selectedTileColor: KColors.buttonColor,
              title: Text(
                '${questions?.answers![index].text}',
                style:Theme.of(context).textTheme.bodyMedium,
              ),
              value: questions?.answers![index].id,
              groupValue: quizAnswers[qIndex],
              onChanged: (value) {
                QuizCubit.get(context).quizSelectAnswer(index, value);
           },
            );
          },
        );
     
  }
}