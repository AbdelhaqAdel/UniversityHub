import 'package:flutter/material.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/features/student/quizzes/data/models/question_data_model.dart';
import 'package:universityhup/features/student/quizzes/presentation/manager/cubit/quiz_cubit.dart';

class AnswerListView extends StatelessWidget {
  const AnswerListView({
    required this.questions,
    required this.quizAnswers,
    super.key});
      final Questions? questions;
      final List<String> quizAnswers;
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
              groupValue: quizAnswers[index],
              onChanged: (value) {
                QuizCubit.get(context).quizSelectAnswer(index, value);
           },
            );
          },
        );
     
  }
}