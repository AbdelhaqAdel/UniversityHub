import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:universityhup/features/instructor_role/assignment/domain/entities/assignment_entity.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/header.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/info.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/states.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_widget/upload_download.dart';

import '../../../../../core/constants/constant.dart';

class PendingAssignmentInstructor extends StatelessWidget {
  final AssignmentInstructorEntity? assignmentEntity;
  const PendingAssignmentInstructor({
    super.key,
    required this.assignmentEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .5),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left: 15),
        child: Column(
          children: [
            PendingHeader(assignmentEntity: assignmentEntity),
            const SizedBox(
              height: 7,
            ),
            Container(
              color: Colors.black.withOpacity(.3),
              height: .5,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                   Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.bookmark,
                                size: 12,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                child: Text(
                                  currentCycleName!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.user,
                                size: 12,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'Start',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 12,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'Ended ',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // App_cubit.get(context).insGetStuUploadTasks(
                            //     assignId: assign?.taskId);
                            // showDialog<String>(
                            //   context: context,
                            //   barrierColor: Colors.black.withOpacity(.3),
                            //   useSafeArea: true,
                            //   builder: (BuildContext context) => AlertDialog(
                            //     insetPadding: const EdgeInsets.all(0.0),
                            //     scrollable: false,
                            //     shadowColor: Colors.transparent,
                            //     content: Center(
                            //       child: Container(
                            //         width: MediaQuery.of(context).size.width,
                            //         child: GestureDetector(
                            //           onTap: () {
                            //             Navigator.pop(context);
                            //           },
                            //           child: GlassBox(
                            //               widget: Stack(
                            //                 children: [
                            //                   Column(
                            //                     children: [
                            //                       const Spacer(),
                            //                       Padding(
                            //                         padding:
                            //                             const EdgeInsets.all(
                            //                                 15.0),
                            //                         child: GlassBoxWithBorder(
                            //                           widget: Container(
                            //                             height: 350,
                            //                             child: Padding(
                            //                               padding:
                            //                                   const EdgeInsets
                            //                                       .only(
                            //                                       bottom:
                            //                                           25.0,
                            //                                       left: 25,
                            //                                       right: 25,
                            //                                       top: 20),
                            //                               child: Column(
                            //                                 children: [
                            //                                   Row(
                            //                                     mainAxisAlignment:
                            //                                         MainAxisAlignment
                            //                                             .center,
                            //                                     crossAxisAlignment:
                            //                                         CrossAxisAlignment
                            //                                             .center,
                            //                                     children: [
                            //                                       FaIcon(
                            //                                         FontAwesomeIcons
                            //                                             .solidUser,
                            //                                         color: Colors
                            //                                             .teal,
                            //                                         size: 18,
                            //                                       ),
                            //                                       SizedBox(
                            //                                         width: 15,
                            //                                       ),
                            //                                       Container(
                            //                                           child:
                            //                                               Text(
                            //                                         'Student name',
                            //                                         textAlign:
                            //                                             TextAlign
                            //                                                 .center,
                            //                                         style: Theme.of(
                            //                                                 context)
                            //                                             .textTheme
                            //                                             .bodySmall
                            //                                             ?.copyWith(
                            //                                               color:
                            //                                                   Colors.teal,
                            //                                               fontSize:
                            //                                                   18,
                            //                                               fontWeight:
                            //                                                   FontWeight.w900,
                            //                                             ),
                            //                                       )),
                            //                                       Spacer(),
                            //                                       // Container(
                            //                                       //     child: Text(
                            //                                       //       'Upload at',
                            //                                       //       textAlign: TextAlign.center,
                            //                                       //       style: Theme.of(context)
                            //                                       //           .textTheme
                            //                                       //           .bodySmall
                            //                                       //           ?.copyWith(
                            //                                       //         color: Colors.teal,
                            //                                       //         fontSize: 15,
                            //                                       //         fontWeight: FontWeight.w900,
                            //                                       //       ),
                            //                                       //     )),
                            //                                     ],
                            //                                   ),
                            //                                   SizedBox(
                            //                                     height: 20,
                            //                                   ),
                            //                                   Container(
                            //                                     height: 2,
                            //                                     color: Colors
                            //                                         .teal,
                            //                                     width: double
                            //                                         .infinity,
                            //                                   ),
                            //                                   SizedBox(
                            //                                     height: 20,
                            //                                   ),
                            //                                   Container(
                            //                                     height: 150,
                            //                                     child: ListView
                            //                                         .separated(
                            //                                       itemBuilder:
                            //                                           (context,
                            //                                                   index) =>
                            //                                               showSTU_UploadeTask(
                            //                                         index:
                            //                                             index +
                            //                                                 1,
                            //                                         context:
                            //                                             context,
                            //                                         stuAssign:
                            //                                             App_cubit.get(context)
                            //                                                 .studentUplodeTaskModel[index],
                            //                                         taskid:
                            //                                             '',
                            //                                       ),
                            //                                       separatorBuilder:
                            //                                           (context,
                            //                                                   index) =>
                            //                                               Container(
                            //                                         height: 1,
                            //                                         color: Colors
                            //                                             .teal,
                            //                                         width: double
                            //                                             .infinity,
                            //                                       ),
                            //                                       itemCount: App_cubit.get(
                            //                                               context)
                            //                                           .studentUplodeTaskModel
                            //                                           .length,
                            //                                     ),
                            //                                   ),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                           ),
                            //                           color: Colors.white
                            //                               .withOpacity(.5),
                            //                           borderRadius: 30,
                            //                           x: 15,
                            //                           y: 15,
                            //                           BorderWidth: 1,
                            //                           BorderColor:
                            //                               Colors.white,
                            //                         ),
                            //                       ),
                            //                       const Spacer(
                            //                         flex: 1,
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ],
                            //               ),
                            //               color: Colors.transparent,
                            //               borderRadius: 0,
                            //               x: 3,
                            //               y: 3),
                            //         ),
                            //       ),
                            //     ),
                            //     elevation: 0,
                            //     clipBehavior: Clip.none,
                            //     surfaceTintColor: Colors.transparent,
                            //     backgroundColor: Colors.transparent,
                            //     contentPadding: EdgeInsets.zero,
                            //   ),
                            // );
                          },
                          child: Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(.6),
                              borderRadius: BorderRadius.circular(12),
                              // border: Border.all(width: .5),
                            ),
                            child: const Center(
                              child: Text(
                                'Available',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: LinearPercentIndicator(
                percent: assignmentEntity!.numberOfStudentsUploads! /
                    assignmentEntity!.numberOfAllStudents!,
                backgroundColor: Colors.blueGrey.withOpacity(.2),
                progressColor: Colors.teal.withOpacity(.6),
                barRadius: const Radius.circular(20),
                lineHeight: 12,
                trailing: Text('${assignmentEntity!.numberOfAllStudents}'),
                leading: Text('${assignmentEntity!.numberOfStudentsUploads}'),

                animation: true,
                animationDuration: 1500,
                curve: Curves.easeOutBack,

                // footer: Padding(
                //   padding: const EdgeInsets.only(top:0.0),
                //   child: Text('Submited',
                //     style: TextStyle(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 15,
                //       color: Colors.teal,
                //     ),
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
