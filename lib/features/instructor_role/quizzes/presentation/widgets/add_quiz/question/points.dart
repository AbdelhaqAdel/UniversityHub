import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../manager/quiz_cubit.dart';

class Points extends StatelessWidget {
  const Points({
    super.key,
    required this.cubit,
    required this.index,
  });

  final QuizInstructorCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120, right: 0.0),
      child: Container(
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30)),

          // color: Colors.blueGrey.withOpacity(.1),
          color: Colors.blueGrey.withOpacity(.3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            maxLines: 5,
            controller: cubit.gradeListController[index],
            cursorColor: Colors.white,
            style: const TextStyle(
              fontSize: 20,
            ),
            decoration: const InputDecoration(
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  FaIcon(
                    FontAwesomeIcons.chartSimple,
                    color: Colors.white54,
                    size: 25,
                  ),
                ],
              ),
              hintText: 'Points',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
