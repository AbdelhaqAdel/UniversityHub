import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';

import '../../domain/entities/quiz_entity.dart';

class QuizTitle extends StatelessWidget {
  const QuizTitle({required this.quiz,super.key});
  final QuizEntity quiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text('${quiz.title}'),
                const Spacer(),
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.clock,
                      size: 26,
                      color:KColors.tealColor,
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(
              height: 7.h,
            ),
            Container(
              color: KColors.primaryColor,
              height: .5,
            ),
           SizedBox(
              height: 10.h,
            ),
      ],
    );
  }
}