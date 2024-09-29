import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/functions/custom_dialog.dart';
import '../../../../../../core/functions/setup_service_locator.dart';
import '../../../domain/entities/student_task_uploaded_entity.dart';
import '../../../domain/repositories/assignment_repo.dart';
import '../../../domain/use_cases/add_assignment_usecase.dart';
import '../../../domain/use_cases/delete_assignment_usecase.dart';
import '../../../domain/use_cases/get_assignment_usecase.dart';
import '../../../domain/use_cases/get_student_submit_assignment_usecase.dart';
import '../../../domain/use_cases/set_grade_assignment_usecase.dart';
import '../../../domain/use_cases/update_assignment_usecase.dart';
import '../../manager/assignment_cubit.dart';
import 'add_grade_dialog.dart';


class StudentTaskInfoItem extends StatelessWidget {
  const StudentTaskInfoItem(
      {super.key,
        this.studentTaskUploadedEntity,
        required this.index,
        required this.taskId});
  final StudentTaskUploadedEntity? studentTaskUploadedEntity;
  final int index;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$index.  ',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          '${studentTaskUploadedEntity?.studentName}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            clickOnMore(context);
          },
          child: const _More(),
        ),
      ],
    );
  }

  void clickOnMore(BuildContext context) {
     customDialog(context: context, widget:  BlocProvider.value(
       value: AssignmentInstructorCubit.get(context),
      child: AddGradeDialog( studentTaskUploadedEntity: studentTaskUploadedEntity!,taskId: taskId,),
    ),);
  }
}

class _More extends StatelessWidget {
  const _More();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal, width: 2)),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 6),
        child: Text(
          'more',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}



