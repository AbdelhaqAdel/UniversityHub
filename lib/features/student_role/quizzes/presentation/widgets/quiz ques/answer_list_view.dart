import 'package:flutter/material.dart';
import 'package:universityhup/core/style/colors.dart';

import '../../../data/models/question_data_model.dart';
import '../../manager/cubit/quiz_cubit.dart';

class AnswerListView extends StatefulWidget {
  const AnswerListView({
    required this.questions,
    required this.quizAnswers,
    required this.qIndex,
    super.key});
      final Questions? questions;
      final List<String> quizAnswers;
      final int qIndex;

  @override
  State<AnswerListView> createState() => _AnswerListViewState();
}

class _AnswerListViewState extends State<AnswerListView> {
  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
          shrinkWrap: true,
          itemCount: widget.questions?.answers?.length,
          itemBuilder: (context, index) {
            return RadioListTile(
              selectedTileColor: KColors.buttonColor,
              title: Text(
                '${widget.questions?.answers![index].text}',
                style:Theme.of(context).textTheme.bodyMedium,
              ),
              value: widget.questions?.answers?[index].id,
              groupValue: QuizCubit.get(context).allQuizAnswers![widget.qIndex],
              onChanged: (value) {
                setState(() {
                 QuizCubit.get(context).allQuizAnswers![widget.qIndex] = value!;
                });
           },
            );
          },
        );
     
  }
}