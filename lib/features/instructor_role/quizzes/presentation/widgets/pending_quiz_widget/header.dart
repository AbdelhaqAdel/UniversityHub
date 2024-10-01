import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/alert.dart';
import '../../../domain/entities/quiz_entity.dart';
import '../../manager/quiz_cubit.dart';




class PendingHeader extends StatelessWidget {
  const PendingHeader({
    super.key,
    required this.quizEntity,
  });

  final QuizInstructorEntity? quizEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text('${quizEntity?.title}'),
        const Spacer(),
        InkWell(
          onTap: () {
            alert(
                context: context,
                no: () {
                  GoRouter.of(context).pop();
                },
                text: 'Do you want to edit Quiz ?',
                yes: () {
                  GoRouter.of(context).pop();
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              // color: Colors.yellow.withOpacity(.9),
              border: Border.all(
                width: .8,
                color: Colors.blue.withOpacity(1),
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.pen,
                size: 15,
                color: Colors.blue.withOpacity(1),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        InkWell(
          onTap: () {
            alert(
                context: context,
                no: () {
                  GoRouter.of(context).pop();
                },
                text: 'Do you want to delete Quiz ?',
                yes: () {
                  QuizInstructorCubit.get(context).deleteQuiz(
                      quizId: quizEntity!.id!);
                  GoRouter.of(context).pop();
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              // color: Colors.red.withOpacity(.6),
              border: Border.all(
                width: .8,
                color: Colors.red.withOpacity(1),
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.trashCan,
                size: 15,
                color: Colors.red.withOpacity(1),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        InkWell(
          onTap: () {
            alert(
                context: context,
                no: () {
                  GoRouter.of(context).pop();
                },
                text: 'Do you want to see Quiz ?',
                yes: () {
                  GoRouter.of(context).pop();
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              // color: Colors.teal.withOpacity(.6),
              border: Border.all(
                width: .8,
                color: Colors.teal.withOpacity(1),
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.eye,
                size: 15,
                color: Colors.teal.withOpacity(1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

