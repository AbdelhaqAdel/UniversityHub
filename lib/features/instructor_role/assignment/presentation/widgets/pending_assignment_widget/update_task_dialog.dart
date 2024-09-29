import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/start_date.dart';
import '../../../../../../core/functions/date_time_picker.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/models/update_assignment_input.dart';
import '../../../domain/entities/assignment_entity.dart';
import '../../manager/assignment_cubit.dart';

import 'end_date.dart';


class UpdateTaskDialog extends StatefulWidget {
  const UpdateTaskDialog({
    super.key,
    required this.assignmentEntity, required this.cubit,
  });

  final AssignmentInstructorEntity? assignmentEntity;
  final AssignmentInstructorCubit cubit;



  @override
  State<UpdateTaskDialog> createState() => _UpdateTaskDialogState();
}

class _UpdateTaskDialogState extends State<UpdateTaskDialog> {
  var updateTaskFormKey = GlobalKey<FormState>();
  var taskGradeController = TextEditingController();
  var taskNameController = TextEditingController();
  String? startDate=DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(DateTime.now());
  String? endDate =DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocListener<AssignmentInstructorCubit, AssignmentInstructorState>(
        listener: (context, state) {
          if(state is GetAssignmentInstructorSuccessState ){
            GoRouter.of(context).pop();
          }
        },
        child: BlocBuilder<AssignmentInstructorCubit,
            AssignmentInstructorState>(
          builder: (context, state) {
            return SizedBox(
              height: 430,
              child: Padding(
                padding:
                const EdgeInsets.only(
                    bottom: 25.0, left: 25, right: 25, top: 20),
                child: Form(
                  key: updateTaskFormKey,
                  child: Column(
                    children: [
                      const Spacer(),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          height: 60,
                          child: CustomTextFormField(
                            controller: taskNameController,
                            keyboardType: TextInputType.text,
                            hintText: 'name',
                            prefixIcon: FontAwesomeIcons.solidPenToSquare,
                            obscureText: false,
                            suffix: const SizedBox(),
                            borderRadius: 18,
                            withBorder: false,
                            height: 60,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          height: 60,
                          child: CustomTextFormField(
                            controller: taskGradeController,
                            keyboardType: TextInputType.number,
                            hintText: 'Points',
                            prefixIcon: FontAwesomeIcons.solidPenToSquare,
                            obscureText: false,
                            suffix: const SizedBox(),
                            borderRadius: 18,
                            withBorder: false,
                            height: 60,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 60,
                        child: GestureDetector(
                          onTap: () async {
                            startDate = await AssignmentInstructorCubit.get(context).pickDateTime(context: context);
                          },
                          child:  StartDate(startData:DateTime.parse(startDate!)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        child: GestureDetector(
                          onTap: () async {
                            endDate = await AssignmentInstructorCubit.get(context).pickDateTime(context: context);
                          },
                          child:  EndDate(endDate:DateTime.parse(endDate!)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      state is UpdateAssignmentLoadingState ?
                      const CircularProgressIndicator()
                          :
                      CustomButton(
                          onTap: () {
                            _update(context);
                          },
                          text: 'Confirm changes'),
                      // SizedBox(
                      //   height: 15,
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _update(context) {
    if (updateTaskFormKey.currentState!.validate()) {
      UpdateAssignmentInstructorInputModel
      updateAssignmentInstructorInputModel =
      UpdateAssignmentInstructorInputModel(
          taskId: widget.assignmentEntity!.taskId,
          taskName: taskNameController.text,
          taskGrade: taskGradeController.text,
          startDate: startDate,
          endDate: endDate);
      AssignmentInstructorCubit.get(context).updateAssignment(
          updateAssignmentInstructorInputModel:
          updateAssignmentInstructorInputModel);
    }
  }
}




