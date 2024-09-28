import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/task_uploaded/student_task_result_item.dart';

import '../../manager/assignment_cubit.dart';

class TaskResultListView extends StatefulWidget {
  const TaskResultListView({
    super.key,
    required this.taskId,
  });
  final String taskId;

  @override
  State<TaskResultListView> createState() => _TaskResultListViewState();
}

class _TaskResultListViewState extends State<TaskResultListView> {
  List studentUploadedTask = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentInstructorCubit, AssignmentInstructorState>(
      listener: (context, state) {
        if (state is GetStudentSubmitAssignmentSuccessState) {
          studentUploadedTask = state.studentTaskUploadedEntity;
        }
      },
      builder: (context, state) {
        if(studentUploadedTask.isNotEmpty){
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => StudentTaskInfoItem(
                  taskId: widget.taskId,
                  index: index + 1,
                  studentTaskUploadedEntity: studentUploadedTask[index]),
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.teal,
                width: double.infinity,
              ),
              itemCount: studentUploadedTask.length,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}