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
    return SizedBox(
      width: MediaQuery.of(context).size.width/2.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            height: 45.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:  quiz.status!='Solved'
                                  ? KColors.tealColor
                                  : KColors.errorColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                quiz.status!,
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