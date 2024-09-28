import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/functions/custom_dialog.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';

import '../../../../../../core/functions/open_file.dart';
import '../../../../../../core/functions/setup_service_locator.dart';
import '../../../../../../core/widgets/alert.dart';
import '../../../../../../core/widgets/custom_button.dart';
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


var updateTaskFormKey=GlobalKey<FormState>();
var taskGradeController = TextEditingController();
var taskNameController = TextEditingController();

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
                    widget: BlocProvider(
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
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  alignment: Alignment.center,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    child: TextFormField(
                                      controller: taskNameController,
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value) {
                                        print(value);
                                      },
                                      validator:
                                          (value) {
                                        if (value!
                                            .isEmpty) {
                                          return 'name can\'t be empty';
                                        }
                                        return null;
                                      },
                                      // toolbarOptions:
                                      //     ToolbarOptions(paste: true, copy: true),
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 10),
                                          child: FaIcon(
                                            FontAwesomeIcons.edit,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                        hintText: 'Task name',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  alignment: Alignment.center,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    child: TextFormField(
                                      controller: taskGradeController,
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value) {
                                        print(value);
                                      },
                                      validator:
                                          (value) {
                                        if (value!
                                            .isEmpty) {
                                          return 'point can\'t be empty';
                                        }
                                        return null;
                                      },
                                      toolbarOptions:
                                          ToolbarOptions(paste: true, copy: true),
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 10),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidEdit,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                        hintText: 'Task grade',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
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
                                                  ColorScheme.dark().copyWith(
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
                                            FaIcon(FontAwesomeIcons.clock),
                                            SizedBox(
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
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white
                                                    .withOpacity(.3),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                      '${''}',
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
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white
                                                    .withOpacity(.3),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
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
                                                  ColorScheme.dark().copyWith(
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
                                            FaIcon(FontAwesomeIcons.clock),
                                            SizedBox(
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
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white
                                                    .withOpacity(.3),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                      '${''}',
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
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white
                                                    .withOpacity(.3),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                SizedBox(
                                  height: 15,
                                ),
                                CustomButton(
                                    onTap: () {
                                      if (updateTaskFormKey.currentState!.validate()) {
                                        UpdateAssignmentInstructorInputModel updateAssignmentInstructorInputModel =
                                        UpdateAssignmentInstructorInputModel(taskId: assignmentEntity!.taskId, taskName: taskNameController.text, taskGrade: taskGradeController.text, startDate: '2024-03-23T22:31:30.911Z', endDate: '2025-03-23T22:31:30.911Z');
                                        AssignmentInstructorCubit.get(context).updateAssignment(updateAssignmentInstructorInputModel: updateAssignmentInstructorInputModel);
                                        GoRouter.of(context).pop();
                                      }

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
                    ),
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
