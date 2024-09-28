import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import '../../../../../../core/constants/constant.dart';
import '../../../../../../core/functions/custom_dialog.dart';
import '../../../../../../core/functions/setup_service_locator.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/glass_box.dart';
import '../../../data/models/set_grade_assignment_input.dart';
import '../../../domain/entities/student_task_uploaded_entity.dart';
import '../../../domain/repositories/assignment_repo.dart';
import '../../../domain/use_cases/add_assignment_usecase.dart';
import '../../../domain/use_cases/delete_assignment_usecase.dart';
import '../../../domain/use_cases/get_assignment_usecase.dart';
import '../../../domain/use_cases/get_student_submit_assignment_usecase.dart';
import '../../../domain/use_cases/set_grade_assignment_usecase.dart';
import '../../../domain/use_cases/update_assignment_usecase.dart';
import '../../manager/assignment_cubit.dart';

class TaskResultBody extends StatelessWidget {
  const TaskResultBody({super.key, required this.taskId});
  final String taskId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            DefaultAppBar(text: currentCycleName, context: context),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: Colors.teal,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Student name',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.teal,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 2,
                      color: Colors.teal,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TaskResultListView(
                      taskId: taskId,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        return SizedBox(
          height: 150,
          child: ListView.separated(
            itemBuilder: (context, index) => StudentTaskInfo(
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
      },
    );
  }
}

var setTaskGradeController = TextEditingController();
var gradeFromKey = GlobalKey<FormState>();

class StudentTaskInfo extends StatelessWidget {
  const StudentTaskInfo(
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
            customDialog(context: context, widget:  BlocProvider(
              create: (context) => AssignmentInstructorCubit(
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
              child: SizedBox(
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
                        '${studentTaskUploadedEntity?.studentName}',
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
                                '${studentTaskUploadedEntity?.timeUploaded}',
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
                                    print(value);
                                  },
                                  validator:
                                      (value) {
                                    if (value!
                                        .isEmpty) {
                                      return 'Points title can\'t be empty';
                                    }
                                    return null;
                                  },
                                  toolbarOptions:
                                  ToolbarOptions(paste: true, copy: true),
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
                                            .solidEdit,
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
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // App_cubit.get(
                                //     context)
                                //     .openFile_Fun(
                                //     networkFile: studentTaskUploadedEntity
                                //         ?.filePath
                                //         ?.split(
                                //         'net/')
                                //         .last);
                              },
                              child: Container(
                                padding:
                                const EdgeInsets
                                    .symmetric(
                                    vertical: 5,
                                    horizontal: 10),
                                alignment:
                                Alignment.center,
                                height: 60,
                                decoration:
                                BoxDecoration(
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
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                      FaIcon(FontAwesomeIcons
                                          .folderOpen),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Open File',
                                        style:
                                        TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                  taskId:taskId,
                                  studentId:    studentTaskUploadedEntity!
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
            ),
),);
          },
          child: Container(
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
          ),
        ),
      ],
    );
  }
}
