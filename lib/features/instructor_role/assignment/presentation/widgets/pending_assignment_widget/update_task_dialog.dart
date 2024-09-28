import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/start_date.dart';
import '../../../../../../core/functions/date_time_picker.dart';
import '../../../../../../core/functions/setup_service_locator.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/models/update_assignment_input.dart';
import '../../../domain/entities/assignment_entity.dart';
import '../../../domain/repositories/assignment_repo.dart';
import '../../../domain/use_cases/add_assignment_usecase.dart';
import '../../../domain/use_cases/delete_assignment_usecase.dart';
import '../../../domain/use_cases/get_assignment_usecase.dart';
import '../../../domain/use_cases/get_student_submit_assignment_usecase.dart';
import '../../../domain/use_cases/set_grade_assignment_usecase.dart';
import '../../../domain/use_cases/update_assignment_usecase.dart';
import '../../manager/assignment_cubit.dart';
import 'package:intl/intl.dart';

import 'end_date.dart'; // Make sure to import this package for date formatting.


class UpdateTaskDialog extends StatefulWidget {
  const UpdateTaskDialog({
    super.key,
    required this.assignmentEntity,
  });

  final AssignmentInstructorEntity? assignmentEntity;


  @override
  State<UpdateTaskDialog> createState() => _UpdateTaskDialogState();
}

class _UpdateTaskDialogState extends State<UpdateTaskDialog> {
  var updateTaskFormKey = GlobalKey<FormState>();
  var taskGradeController = TextEditingController();
  var taskNameController = TextEditingController();
  String? startDate;
  String? endDate;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AssignmentInstructorCubit(
              getAssignmentInstructorUseCase: GetAssignmentInstructorUseCase(
                assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
              ),
              updateAssignmentInstructorUseCase: UpdateAssignmentInstructorUseCase(
                assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
              ),
              setGradeAssignmentUseCase: SetGradeAssignmentUseCase(
                assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
              ),
              addAssignmentUseCase: AddAssignmentUseCase(
                assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
              ),
              deleteAssignmentUseCase: DeleteAssignmentUseCase(
                assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
              ),
              getStudentSubmitAssignmentUsecase: GetStudentSubmitAssignmentUsecase(
                assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
              )),
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
                            startDate = await dataTimePicker(context: context);
                          },
                          child: StartDate(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        child: GestureDetector(
                          onTap: () async {
                            endDate = await dataTimePicker(context: context);
                          },
                          child: EndDate(),
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




