import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/add_assignment/result_card.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/add_assignment/task_file_view.dart';
import '../../manager/assignment_cubit.dart';
import 'add_task_file_card.dart';


class Step3Content extends StatelessWidget {
  const Step3Content({
    super.key,
    required this.taskNameController,
    required this.taskGradeController,
    required this.endDate,
    required this.startDate,
  });

  final TextEditingController taskNameController;
  final TextEditingController taskGradeController;
  final String? endDate;
  final String? startDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResultCard(
            taskNameController: taskNameController,
            taskGradeController: taskGradeController,
            endDate: DateTime.parse(endDate!),
            startDate: DateTime.parse(startDate!),
          ),
          const SizedBox(
            height: 15,
          ),
          AssignmentInstructorCubit.get(context)
              .file
              .isNotEmpty
              ? AssignFileViewWidget(
              0,
              context,
              AssignmentInstructorCubit.get(context)
                  .file[0])
              : InkWell(
            onTap: () {
              if (AssignmentInstructorCubit.get(
                  context)
                  .file
                  .isEmpty) {
                AssignmentInstructorCubit.get(context)
                    .callPickFile();
              }
            },
            child: const AddTaskFileCard(),
          ),
        ],
      ),
    );
  }
}
