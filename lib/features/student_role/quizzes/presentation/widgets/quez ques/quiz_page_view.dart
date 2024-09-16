import 'package:flutter/material.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quez%20ques/quiz_ques_widget.dart';

import '../../../data/models/question_data_model.dart';

// class QuizPageView extends StatefulWidget {
//    QuizPageView({
//     required this.islast,
//     required this.isStart,
//     required this.isBack,
//     required this.ques,
//     super.key});
//   bool islast=false;
//    bool isStart;
//    bool isBack;
//   final List<Questions>ques;
//   @override
//   State<QuizPageView> createState() => _QuizPageViewState();
//   initState() {
//       islast=false;
//       isStart=false;
//      isBack=false;
//   }
// }
// class _QuizPageViewState extends State<QuizPageView> {
//   @override
//   Widget build(BuildContext context) {
//     return  PageView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         onPageChanged: (index) {
//                           if (index == ques.length - 1) {
//                             setState(() {
//                               islast = true;
//                             });
//                           }
//                           else if (index >=1) {
//                             setState(() {
//                               isStart = true;
//                             });
//                           } else {
//                             setState(() {
//                               islast = false;
//                               isStart = false;
//                             });
//                           }
//                         },
//                         controller: boardcontroller,
//                         itemBuilder: (context, index) => QuizQuesWidget(
//                           qIndex: index,
//                           questions: ques[index]
//                         ),
//                         itemCount:ques.length
//                       );
//   }
// }

class QuizPageView extends StatefulWidget {
  const QuizPageView({
  required this.islast,
  required this.isStart,
  required this.ques,
  required this.boardcontroller,
    super.key,});
    final bool islast;
    final bool isStart;
   final PageController? boardcontroller;
   final List<Questions>?ques;

  @override
  State<QuizPageView> createState() => QuizPageViewState();
}

class QuizPageViewState extends State<QuizPageView> {
   QuizPageViewState({
   this.islast,
   this.isStart,
   this.ques,
   this.boardcontroller,
    });
   bool? islast;
   bool? isStart;
   PageController? boardcontroller;
   List<Questions>?ques;

  @override
  Widget build(BuildContext context) {
    
    return   PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
               onPageChanged: (index) {
                if (index == ques!.length - 1) {
                   setState(() {
                     islast = true;
                   });
                 }
                 else if (index >=1) {
                   setState(() {
                     isStart = true;
                   });
                 } else {
                   setState(() {
                     islast = false;
                     isStart = false;
                   });
                 }              },
              controller: boardcontroller,
              itemBuilder: (context, index) => QuizQuesWidget(
                qIndex: index,
                questions: ques?[index]
              ),
              itemCount:ques?.length
              );
 
  }}