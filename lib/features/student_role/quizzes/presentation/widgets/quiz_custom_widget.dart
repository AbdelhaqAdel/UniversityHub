import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quiz_data.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quiz_status.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quiz_title.dart';

import '../../domain/entities/quiz_entity.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({
     required this.quiz,
     required this.index,
     super.key});
  final QuizEntity quiz;
  // final List<bool> quizIsComplete;
  // final List<bool> isQuizStart;
  final int index;
   @override
  Widget build(BuildContext context) {
     var screenSize=MediaQuery.of(context).size;
    return Container(
      height: screenSize.height/5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .5),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left: 15),
        child: Column(
          children: [
            QuizTitle(quiz: quiz,),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          QuizData(icon: FontAwesomeIcons.bookmark,
                          text: currentCycleName!,),
                        
                        QuizData(icon:FontAwesomeIcons.user,
                          text: quiz.status??'not found',),
                       
                        const QuizData(icon: FontAwesomeIcons.chartLine,
                          text:'10 minutes',),
                       
                        QuizData(icon: FontAwesomeIcons.clock,
                          text:'From ${DateTime.parse(quiz.startDate!).hour}:${DateTime.parse(quiz.startDate!).minute}'
                          ' to  ${DateTime.parse(quiz.endDate!).hour}:${DateTime.parse(quiz.endDate!).minute} ',
                          ),
                        
                          // Row(
                          //   children: [
                          //     const FaIcon(
                          //       FontAwesomeIcons.bookmark,
                          //       size: 12,
                          //     ),
                          //     SizedBox(
                          //       width: 7.w,
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         '${App_cubit.get(context).currentCourseName}',
                          //         maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //         textAlign: TextAlign.start,
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.w700, fontSize: 13),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 2,
                          // ),
                          // Row(
                          //   children: [
                          //     FaIcon(
                          //       FontAwesomeIcons.user,
                          //       size: 12,
                          //     ),
                          //     SizedBox(
                          //       width: 7,
                          //     ),
                          //     Text(
                          //       '${quiz?.status}',
                          //       textAlign: TextAlign.start,
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.w700, fontSize: 13),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 2,
                          // ),
                          // Row(
                          //   children: [
                          //     FaIcon(
                          //       FontAwesomeIcons.chartLine,
                          //       size: 12,
                          //     ),
                          //     SizedBox(
                          //       width: 7,
                          //     ),
                          //     Text(
                          //       '10 minutes',
                          //       textAlign: TextAlign.start,
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.w700, fontSize: 13),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 2,
                          // ),
                          // Row(
                          //   children: [
                          //     FaIcon(
                          //       FontAwesomeIcons.clock,
                          //       size: 12,
                          //     ),
                          //     SizedBox(
                          //       width: 7,
                          //     ),
                          //     Container(
                          //       width: 150,
                          //       child: Text(
                          //         'From ${DateTime.parse(quiz!.startDate!).hour}:${DateTime.parse(quiz!.startDate!).minute}  to  ${DateTime.parse(quiz!.endDate!).hour}:${DateTime.parse(quiz!.endDate!).minute} ',
                          //         overflow: TextOverflow.ellipsis,
                          //         maxLines: 1,
                          //         textAlign: TextAlign.start,
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.w700,
                          //             fontSize: 13),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                       
                        ],
                      ),
                    ),
                  ),
                   QuizStatus(quiz: quiz,)
              ],
              ),
            ),
          ],
        ),
      ),
    );
     }
}

