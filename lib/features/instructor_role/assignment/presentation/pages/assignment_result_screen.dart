import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/assignment_cubit.dart';
import '../widgets/task_uploaded/task_result_body.dart';

class TaskResultScreen extends StatelessWidget {
  const TaskResultScreen({super.key, required this.taskId, required this.cubit});
  final AssignmentInstructorCubit cubit; // Receive the cubit from the first screen
  final String taskId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: TaskResultBody(
        taskId: taskId,
      ),
    );
  }
}
