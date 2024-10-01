import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../manager/quiz_cubit.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem(
      {super.key,
      required this.index,
      required this.index2,
      required this.cubit});
  final int index;
  final int index2;
  final QuizInstructorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomRight: Radius.circular(35)),

                // color: Colors.blueGrey.withOpacity(.1),
                color: Colors.blue.withOpacity(.2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  controller: cubit.answerListController[index][index2],
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        FaIcon(
                          FontAwesomeIcons.a,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                    suffixIcon: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.setAnswerCheck(index, index2);
                          },
                          child: FaIcon(
                            cubit.answerCheck[index][index2]
                                ? FontAwesomeIcons.circleCheck
                                : FontAwesomeIcons.circleDot,
                            color: cubit.answerCheck[index][index2]
                                ? Colors.teal
                                : Colors.blueGrey.withOpacity(.8),
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    hintText: 'Add Answer',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
