import 'package:flutter/material.dart';
import 'package:universityhup/features/student/quizzes/data/models/question_data_model.dart';
import 'package:universityhup/features/student/quizzes/presentation/widgets/quez%20ques/Answer_builder.dart';
import 'package:universityhup/features/student/quizzes/presentation/widgets/quez%20ques/ques_widget.dart';

class QuizQuesWidget extends StatelessWidget {
  const QuizQuesWidget({
    required this.qIndex,
    required this.questions,
    super.key});
  final int qIndex;
  final Questions? questions;
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        QuesWidget(qIndex:qIndex, questions: questions,),
         SizedBox(height:MediaQuery.of(context).size.height/30),
          AnswerBuilder(index: qIndex,),
//         ListView.builder(
//           shrinkWrap: true,
//           itemCount: questions?.answers?.length,
//           itemBuilder: (context, index) {
//             return RadioListTile(
//               selectedTileColor: Colors.blue,
//               title: Text(
//                 '${questions?.answers![index].text}',
//                 style:
//                     const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//               ),
//               value: questions?.answers![index].id,
//               groupValue: //'',//App_cubit.get(context).quizAnswerSelected,
//                   App_cubit.get(context).allquizAnswers![qIndex],
//               onChanged: (value) {
//                 print(App_cubit.get(context).allquizAnswers![qIndex]);
//                 print(('------${value}'));
//                 App_cubit.get(context).Quiz_Select_answer(qIndex, value);
// //                App_cubit.get(context).allquizAnswers[qIndex]=App_cubit.get(context).quizAnswerSelected;
//                 print(App_cubit.get(context).allquizAnswers);
//                 print(App_cubit.get(context).allquizAnswers![qIndex]);
//                 print(
//                   questions?.answers![index].id,
//                 );
//               },
//             );
//           },
//         ),
     
      ],
    );
  }
}

