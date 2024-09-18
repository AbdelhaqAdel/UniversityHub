import 'package:flutter/material.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quez%20ques/quiz_ques_widget.dart';
import '../../../data/models/question_data_model.dart';

class QuizPageView extends StatelessWidget{
   const QuizPageView({
  required this.ques,
  required this.boardController,
  required this.onPageChanged,
    super.key,});
   final PageController? boardController;
   final List<Questions>?ques;
   final Function(int) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return   PageView.builder(
         physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index)
           {onPageChanged(index);},
         controller: boardController,
         itemBuilder: (context, index) => QuizQuesWidget(
           qIndex: index,
           questions: ques?[index]
         ),
         itemCount:ques?.length
         );
 
  }}