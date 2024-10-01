import 'package:flutter/material.dart';

import '../../../manager/quiz_cubit.dart';
import 'answer_item.dart';

class AnswerListVew extends StatelessWidget {
  const AnswerListVew({
    super.key,
    required this.index,
    required this.cubit,
  });

  final int index;
  final QuizInstructorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index2) => AnswerItem(
          index: index,
          index2: index2,
          cubit: cubit,
        ),
      ),
    );
  }
}
