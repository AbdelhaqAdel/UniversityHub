import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../manager/quiz_cubit.dart';

class QuestionField extends StatelessWidget {
  const QuestionField({
    super.key,
    required this.cubit,
    required this.index,
  });

  final QuizInstructorCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)),

        // color: Colors.blueGrey.withOpacity(.1),
        color: Colors.blue.withOpacity(.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          maxLines: 5,
          controller: cubit.questionListController[index],
          validator: (value) {
            if (value!.isEmpty) {
              return 'Question can\'t be empty';
            }
            return null;
          },
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
                  FontAwesomeIcons.pencil,
                  color: Colors.white30,
                  size: 30,
                ),
              ],
            ),
            hintText: 'Add Question',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
