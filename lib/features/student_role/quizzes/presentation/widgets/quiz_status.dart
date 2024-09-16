import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/core/style/colors.dart';

import '../../domain/entities/quiz_entity.dart';

class QuizStatus extends StatelessWidget {
  const QuizStatus({required this.quiz,
  super.key});
  final QuizEntity quiz;
  @override
  Widget build(BuildContext context) {
    return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // quiz.status == 'Available'
                            //     ? print('Available')
                            //     : print(quiz.status);
                            // //  App_cubit.get(context).quizAnswerSelected='';
                            // //  App_cubit.get(context).allquizAnswers[0]=App_cubit.get(context).quizAnswerSelected;
                            // //  App_cubit.get(context).allquizAnswers =  List<String>.filled(App_cubit.get(context).questionModel.length,'');
                            // print(
                            //     '-------------------------------------------------------');
                            // // print(DateTime.now());
                            // // print(DateTime.parse(quiz.startDate!));
                            // // print(DateTime.parse(quiz.endDate!));
                            // // if(DateTime.now().isAfter(DateTime.parse(quiz.startDate!))&& DateTime.now().isBefore(DateTime.parse(quiz.endDate!))){
                            // App_cubit.get(context).submitQuizAnswers = [];
                            // onQuizStart;
                            // App_cubit.get(context).currentQuizId = quiz.id;
                            // App_cubit.get(context).StuGetQuizDataById();
                            // App_cubit.get(context).currentQuizName = quiz.title;
                            // navigateTo(context, STU_Quizes_Ques_Screen());
                            // // }
                            // print(
                            //     '-------------------------------------------------------');
                          },
                          child: Container(
                            height: 45.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: DateTime.now().isAfter(
                                          DateTime.parse(quiz.startDate!)) &&
                                      DateTime.now().isBefore(
                                          DateTime.parse(quiz.endDate!))
                                  ? KColors.tealColor
                                  : KColors.errorColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                DateTime.now().isAfter(
                                            DateTime.parse(quiz.startDate!)) &&
                                        DateTime.now().isBefore(
                                            DateTime.parse(quiz.endDate!))
                                    ? 'Available'
                                    : 'Pending',
                                style:Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
  }
}