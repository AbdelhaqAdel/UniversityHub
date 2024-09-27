
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../../core/functions/open_file.dart';
import '../../../../../../core/functions/setup_service_locator.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/glass_box.dart';
import '../../../domain/entities/assignment_entity.dart';
import '../../../domain/repositories/assignment_repo.dart';
import '../../../domain/use_cases/get_assignment_info_usecase.dart';
import '../../../domain/use_cases/get_assignment_usecase.dart';
import '../../../domain/use_cases/submit_assignment_usecase.dart';
import '../../manager/assignment_cubit.dart';

class UploadAndDownload extends StatelessWidget {
  const UploadAndDownload({
    super.key,
    required this.assignmentEntity,
  });

  final AssignmentInstructorEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssignmentInstructorCubit(
          getAssignmentInstructorUseCase: GetAssignmentInstructorUseCase(
            assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
          ),
          getAssignmentInstructorInfoUseCase: GetAssignmentInstructorInfoUseCase(
            assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
          ),
          submitAssignmentInstructorUseCase: SubmitAssignmentInstructorUseCase(
            assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
          )),
      child: BlocConsumer<AssignmentInstructorCubit, AssignmentInstructorState>(
        listener: (context, state) {
          if(state is SubmitAssignmentInstructorSuccessState){
            GoRouter.of(context).pop();
            showSnackBar(context: context, message: 'Submit Success');
          }else if(state is SubmitAssignmentInstructorErrorState){
            GoRouter.of(context).pop();
            showSnackBar(context: context, message: 'Submit Failed');

          }
        },
        builder: (context, state) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(0.0),
            scrollable: false,
            shadowColor: Colors.transparent,
            content: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: GlassBox(
                    widget: Stack(
                      children: [
                        Column(
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GlassBox(
                                widget: SizedBox(
                                  height: 180,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 25.0,
                                        left: 25,
                                        right: 25,
                                        top: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const FaIcon(
                                              FontAwesomeIcons.bookmark,
                                              size: 25,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              assignmentEntity!
                                                  .taskName ??
                                                  '',
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                  Colors.black),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            const FaIcon(
                                              FontAwesomeIcons
                                                  .chartSimple,
                                              size: 25,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              '${assignmentEntity!.taskGrade ?? ''}',
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                  Colors.black),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          height: 50,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: CustomButton(
                                                    text: 'Open Task',
                                                    onTap: () {
                                                      // showSnackBar(context: context, message: 'start download file');
                                                      downloadAndOpenFile(
                                                          assignmentEntity!
                                                              .filePath!);
                                                    },
                                                  )),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    if (AssignmentInstructorCubit
                                                        .get(context)
                                                        .file
                                                        .isEmpty) {
                                                      AssignmentInstructorCubit.get(
                                                          context)
                                                          .callPickFile();
                                                    } else {
                                                      AssignmentInstructorCubit.get(
                                                          context)
                                                          .submitAssignmentInstructor(
                                                          assignmentId:
                                                          assignmentEntity!
                                                              .taskId!);
                                                    }
                                                  },
                                                  child:state is SubmitAssignmentInstructorLoadingState? const Center(child: CircularProgressIndicator())
                                                      :  AssignmentInstructorCubit.get(
                                                      context)
                                                      .file
                                                      .isEmpty
                                                      ? Container(
                                                    decoration:
                                                    BoxDecoration(
                                                      color: Colors
                                                          .red
                                                          .withOpacity(
                                                          .7),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                    ),
                                                    child:
                                                    const Padding(
                                                      padding:
                                                      EdgeInsets.all(
                                                          10.0),
                                                      child:
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.file_present_rounded,
                                                            color:
                                                            Colors.white,
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            5,
                                                          ),
                                                          Text(
                                                            'Attach File', //: 'Done',
                                                            style:
                                                            TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                      : Container(
                                                    decoration:
                                                    BoxDecoration(
                                                      color: Colors
                                                          .teal
                                                          .withOpacity(
                                                          .7),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                    ),
                                                    child:
                                                    const Padding(
                                                      padding:
                                                      EdgeInsets.all(
                                                          10.0),
                                                      child:
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                            5,
                                                          ),
                                                          Text(
                                                            'Submit', //: 'Done',
                                                            style:
                                                            TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            10,
                                                          ),
                                                          Icon(
                                                            Icons.send,
                                                            color:
                                                            Colors.white,
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),

                                        // SizedBox(
                                        //   height: 15,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                color: Colors.white.withOpacity(.5),
                                borderRadius: 30,
                                x: 15,
                                y: 15,
                                border: true,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: Colors.transparent,
                    borderRadius: 0,
                    x: 3,
                    y: 3,
                    border: false,
                  ),
                ),
              ),
            ),
            elevation: 0,
            clipBehavior: Clip.none,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
          );
        },
      ),
    );
  }
}