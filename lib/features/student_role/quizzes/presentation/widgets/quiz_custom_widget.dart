import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
             EdgeInsets.only(top: 10.h, right: 15.w, bottom: 10.h, left: 15.w),
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

