
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/functions/store_to_history.dart';

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

  final AssignmentEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssignmentCubit(
          getAssignmentUseCase: GetAssignmentUseCase(
            assignmentRepo: getIt.get<AssignmentRepo>(),
          ),
          getAssignmentInfoUseCase: GetAssignmentInfoUseCase(
            assignmentRepo: getIt.get<AssignmentRepo>(),
          ),
          submitAssignmentUseCase: SubmitAssignmentUseCase(
            assignmentRepo: getIt.get<AssignmentRepo>(),
          )),
      child: BlocConsumer<AssignmentCubit, AssignmentState>(
        listener: (context, state) {
          if(state is SubmitAssignmentSuccessState){
            GoRouter.of(context).pop();
            showSnackBar(context: context, message: 'Submit Success');
          }else if(state is SubmitAssignmentErrorState){
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
                                                      StoryServices.stuStoreHistoryToHive(materialName: 'File name: ${assignmentEntity!.taskName!}', 
                                                      historyMessage: 'New assignment downloaded');
                                                    },
                                                  )),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    if (AssignmentCubit
                                                        .get(context)
                                                        .file
                                                        .isEmpty) {
                                                      AssignmentCubit.get(
                                                          context)
                                                          .callPickFile();
                                                    } else {
                                                      AssignmentCubit.get(
                                                          context)
                                                          .submitAssignment(
                                                          assignmentId:
                                                          assignmentEntity!
                                                              .taskId!);
                                                    }
                                                  },
                                                  child:state is SubmitAssignmentLoadingState? const Center(child: CircularProgressIndicator())
                                                      :  AssignmentCubit.get(
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