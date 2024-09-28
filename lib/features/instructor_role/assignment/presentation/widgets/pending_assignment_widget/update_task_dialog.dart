import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
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
  var updateTaskFormKey=GlobalKey<FormState>();
  var taskGradeController = TextEditingController();
  var taskNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssignmentInstructorCubit(
          getAssignmentInstructorUseCase:
          GetAssignmentInstructorUseCase(
            assignmentRepo:
            getIt.get<AssignmentInstructorRepo>(),
          ),
          updateAssignmentInstructorUseCase:
          UpdateAssignmentInstructorUseCase(
            assignmentRepo:
            getIt.get<AssignmentInstructorRepo>(),
          ),
          setGradeAssignmentUseCase: SetGradeAssignmentUseCase(
            assignmentRepo:
            getIt.get<AssignmentInstructorRepo>(),
          ),
          addAssignmentUseCase: AddAssignmentUseCase(
            assignmentRepo:
            getIt.get<AssignmentInstructorRepo>(),
          ),
          deleteAssignmentUseCase: DeleteAssignmentUseCase(
            assignmentRepo:
            getIt.get<AssignmentInstructorRepo>(),
          ),
          getStudentSubmitAssignmentUsecase:
          GetStudentSubmitAssignmentUsecase(
            assignmentRepo:
            getIt.get<AssignmentInstructorRepo>(),
          )),
      child: Container(
        height: 430,
        child: Padding(
          padding: const EdgeInsets.only(
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
                      prefixIcon:  FontAwesomeIcons.solidPenToSquare,
                      obscureText: false,
                      suffix: const SizedBox(),
                      borderRadius: 18,
                      withBorder: false,height: 60,)),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: 60,
                    child: CustomTextFormField(
                      controller: taskGradeController,
                      keyboardType: TextInputType.number,
                      hintText: 'Points',
                      prefixIcon:  FontAwesomeIcons.solidPenToSquare,
                      obscureText: false,
                      suffix: const SizedBox(),
                      borderRadius: 18,
                      withBorder: false,height: 60,)),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025),
                        builder: (BuildContext context,
                            Widget? child) {
                          return Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme:
                              const ColorScheme.dark().copyWith(
                                primary: Colors
                                    .blue, // Change the primary color as needed
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      //     .then((selectedDate) {
                      //   Navigator.of(context)
                      //       .push(
                      //     showPicker(
                      //       context: context,
                      //       value: time,
                      //       sunrise: TimeOfDay(
                      //           hour: 6, minute: 0), // optional
                      //       sunset: TimeOfDay(
                      //           hour: 18,
                      //           minute: 0), // optional
                      //       duskSpanInMinutes: 120, // optional
                      //
                      //       borderRadius: 25,
                      //       accentColor: Colors.blue,
                      //       blurredBackground: true,
                      //       elevation: 0,
                      //
                      //       is24HrFormat: false,
                      //       onCancel: () {
                      //         Navigator.pop(context);
                      //       },
                      //       onChange: (value) {
                      //         startminutes = value.minute;
                      //         starthours = value.hour;
                      //       },
                      //       // onChangeDateTime: (){},
                      //     ),
                      //   )
                      //       .then((value) {
                      //     if (selectedDate != null) {
                      //       DateTime selectedDateTime =
                      //           DateTime(
                      //         selectedDate.year,
                      //         selectedDate.month,
                      //         selectedDate.day,
                      //         starthours!,
                      //         startminutes!,
                      //       );
                      //       print(
                      //           'Selected date and time: $selectedDateTime');
                      //       App_cubit.get(context)
                      //           .StartDate_Function(
                      //               time: DateFormat(
                      //                       "yyyy-MM-ddTHH:mm:ss.SSS")
                      //                   .format(
                      //                       selectedDateTime));
                      //       print('2024-03-23T22:31:30.911Z');
                      //       // Handle the selected date and time as needed
                      //     }
                      //   });
                      // });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.teal.withOpacity(.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            const FaIcon(FontAwesomeIcons.clock),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Start',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black
                                    .withOpacity(.7),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                color: Colors.white
                                    .withOpacity(.3),
                              ),
                              child: const Padding(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                color: Colors.white
                                    .withOpacity(.3),
                              ),
                              child: const Padding(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025),
                        builder: (BuildContext context,
                            Widget? child) {
                          return Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme:
                              const ColorScheme.dark().copyWith(
                                primary: Colors.blue,

                                // Change the primary color as needed
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      //     .then((selectedDate) {
                      //   Navigator.of(context)
                      //       .push(
                      //     showPicker(
                      //       context: context,
                      //       value: time,
                      //       sunrise: TimeOfDay(
                      //           hour: 6, minute: 0), // optional
                      //       sunset: TimeOfDay(
                      //           hour: 18,
                      //           minute: 0), // optional
                      //       duskSpanInMinutes: 120, // optional
                      //
                      //       borderRadius: 25,
                      //       accentColor: Colors.blue,
                      //       blurredBackground: true,
                      //       elevation: 0,
                      //
                      //       is24HrFormat: false,
                      //       onCancel: () {
                      //         Navigator.pop(context);
                      //       },
                      //       onChange: (value) {
                      //         endminutes = value.minute;
                      //         endhours = value.hour;
                      //       },
                      //       // onChangeDateTime: (){},
                      //     ),
                      //   )
                      //       .then((value) {
                      //     if (selectedDate != null) {
                      //       DateTime selectedDateTime =
                      //           DateTime(
                      //         selectedDate.year,
                      //         selectedDate.month,
                      //         selectedDate.day,
                      //         endhours!,
                      //         endminutes!,
                      //       );
                      //       print(
                      //           'Selected date and time: $selectedDateTime');
                      //       App_cubit.get(context).EndDate_Function(
                      //           time: DateFormat(
                      //                   "yyyy-MM-ddTHH:mm:ss.SSS")
                      //               .format(selectedDateTime));
                      //       print('2024-03-23T22:31:30.911Z');
                      //       // Handle the selected date and time as needed
                      //     }
                      //   });
                      // });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red.withOpacity(.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            const FaIcon(FontAwesomeIcons.clock),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'End',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black
                                    .withOpacity(.7),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                color: Colors.white
                                    .withOpacity(.3),
                              ),
                              child: const Padding(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                color: Colors.white
                                    .withOpacity(.3),
                              ),
                              child: const Padding(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
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
      ),
    );
  }

  void _update(BuildContext context) {
    if (updateTaskFormKey.currentState!.validate()) {
      UpdateAssignmentInstructorInputModel updateAssignmentInstructorInputModel =
      UpdateAssignmentInstructorInputModel(taskId: widget.assignmentEntity!.taskId, taskName: taskNameController.text, taskGrade: taskGradeController.text, startDate: '2024-03-23T22:31:30.911Z', endDate: '2025-03-23T22:31:30.911Z');
      AssignmentInstructorCubit.get(context).updateAssignment(updateAssignmentInstructorInputModel: updateAssignmentInstructorInputModel);
      GoRouter.of(context).pop();
    }
  }
}
