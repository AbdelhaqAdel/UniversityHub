import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import '../../../../../../core/functions/open_file.dart';
import '../../../data/models/set_grade_assignment_input.dart';
import '../../../domain/entities/student_task_uploaded_entity.dart';
import '../../manager/assignment_cubit.dart';
import 'open_student_task.dart';

class AddGradeDialog extends StatefulWidget {
  const AddGradeDialog({
    super.key,
    required this.studentTaskUploadedEntity, required this.taskId,
  });

  final StudentTaskUploadedEntity studentTaskUploadedEntity;
  final String taskId;

  @override
  State<AddGradeDialog> createState() => _AddGradeDialogState();
}

class _AddGradeDialogState extends State<AddGradeDialog> {
  var setTaskGradeController = TextEditingController();
  var gradeFromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 25.0,
            left: 25,
            right: 25,
            top: 20),
        child: Form(
          key: gradeFromKey,
          child: Column(
            children: [
              Text(
                '${widget.studentTaskUploadedEntity.studentName}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.white),
                  borderRadius:
                  BorderRadius.circular(18),
                  color: Colors.blueGrey
                      .withOpacity(.25),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      const FaIcon(
                          FontAwesomeIcons
                              .clock),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${widget.studentTaskUploadedEntity.timeUploaded}',
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      // width: 150,

                      padding: const EdgeInsets
                          .symmetric(
                          vertical: 5,
                          horizontal: 10),
                      alignment:
                      Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.white),
                        borderRadius:
                        BorderRadius
                            .circular(18),
                        color: Colors.white
                            .withOpacity(.5),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets
                            .symmetric(
                            horizontal:
                            0.0),
                        child: TextFormField(
                          controller:
                          setTaskGradeController,
                          keyboardType:
                          TextInputType
                              .number,
                          onFieldSubmitted:
                              (value) {
                          },
                          validator:
                              (value) {
                            if (value!
                                .isEmpty) {
                              return 'Points title can\'t be empty';
                            }
                            return null;
                          },
                          cursorColor:
                          Colors.white,
                          style:
                          const TextStyle(
                            fontSize: 18,
                          ),
                          decoration:
                          const InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets
                                  .symmetric(
                                  horizontal:
                                  10.0,
                                  vertical:
                                  10),
                              child: FaIcon(
                                FontAwesomeIcons
                                    .solidPenToSquare,
                                color: Colors
                                    .white,
                                size: 25,
                              ),
                            ),
                            hintText: 'Points',
                            border: InputBorder
                                .none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OpenStudentTask(filePath: widget.studentTaskUploadedEntity.filePath!),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              CustomButton(
                  onTap: () {
                    if(gradeFromKey.currentState!.validate()){
                      SetGradeAssignmentInputModel
                      setGradeAssignmentInputModel =
                      SetGradeAssignmentInputModel(
                          taskId:widget.taskId,
                          studentId:    widget.studentTaskUploadedEntity
                              .studentId,
                          grade:  int.parse(
                              setTaskGradeController
                                  .text));
                      AssignmentInstructorCubit
                          .get(context)
                          .setGradeAssignment(
                          setGradeAssignmentInputModel:
                          setGradeAssignmentInputModel);
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
    );
  }
}

