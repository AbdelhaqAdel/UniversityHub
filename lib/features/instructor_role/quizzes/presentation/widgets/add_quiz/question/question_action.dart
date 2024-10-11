import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

import '../../../../../../../core/functions/add_quiz_sub_function.dart';
import '../../../../../../../core/widgets/alert.dart';
import '../../../manager/quiz_cubit.dart';

class QuestionAction extends StatelessWidget {
  const QuestionAction({
    super.key,
    required this.cubit,
  });

  final QuizInstructorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      child: GlassBox(
        widget: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: Colors.black.withOpacity(.6)),
          unselectedLabelStyle: TextStyle(color: Colors.black.withOpacity(.6)),
          mouseCursor: MouseCursor.defer,
          showSelectedLabels: true,
          useLegacyColorScheme: false,
          showUnselectedLabels: true,
          onTap: (index) {
            actionClick(index, context);
          },
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.minus,
                size: 20,
                color: Colors.red,
              ),
              label: 'remove Q',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.plus,
                size: 20,
                color: Colors.teal,
              ),
              label: 'Add Q',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.floppyDisk,
                size: 20,
                color: Colors.indigoAccent,
              ),
              label: 'Save',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.check,
                size: 20,
                color: Colors.blue,
              ),
              label: 'Publish',
            ),
          ],
        ),
        color: Colors.blueGrey.withOpacity(.15),
        borderRadius: 20,
        x: 0,
        y: 0,
        border: false,
      ),
    );
  }

  void actionClick(int index, BuildContext context) {
    cubit.setQuestionActionIndex(actionIndex: index);
    switch (cubit.questionActionIndex) {
      case 0:
        removeLastQuestion(cubit: cubit);
        break;

      case 1:
        addQuestion(cubit: cubit);
        break;
      case 2:
        alert(
            context: context,
            no: () {
              GoRouter.of(context).pop();
            },
            text: 'Do you want to save quiz ?',
            yes: () {
              GoRouter.of(context).pop();

            });
        break;
      case 3:
        alert(
            context: context,
            no: () {
              GoRouter.of(context).pop();
            },
            text: 'Do you want to Publish quiz ?',
            yes: () {
              GoRouter.of(context).pop();
              cubit.addQuiz();
            });

        break;
    }
  }
}
