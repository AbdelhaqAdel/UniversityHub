import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/functions/custom_dialog.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import 'package:universityhup/core/functions/store_to_history.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/update_task_dialog.dart';

import '../../../../../../core/functions/open_file.dart';
import '../../../../../../core/widgets/alert.dart';
import '../../../domain/entities/assignment_entity.dart';
import '../../manager/assignment_cubit.dart';




class PendingHeader extends StatelessWidget {
  const PendingHeader({
    super.key,
    required this.assignmentEntity,
  });

  final AssignmentInstructorEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text('${assignmentEntity?.taskName}'),
        const Spacer(),
        InkWell(
          onTap: () {
            alert(
                context: context,
                no: () {
                  GoRouter.of(context).pop();
                },
                text: 'Do you want to edit Task ?',
                yes: () {
                  GoRouter.of(context).pop();
                  customDialog(
                    context: context,
                    widget: UpdateTaskDialog(assignmentEntity: assignmentEntity, cubit: AssignmentInstructorCubit.get(context),),
                  );
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
                text: 'Do you want to delete Task ?',
                yes: () {
                  AssignmentInstructorCubit.get(context).deleteAssignment(
                      assignmentId: assignmentEntity!.taskId!);
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
                text: 'Do you want to see Task ?',
                yes: () {
                  downloadAndOpenFile(assignmentEntity!.filePath!);
                  GoRouter.of(context).pop();
                  showSnackBar(context: context, message: 'File Loading ');
                  StoryServices.insStoreHistoryToHive(materialName: 'File name: ${assignmentEntity!.taskName!}', 
                   historyMessage: 'New assignment downloaded');
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

