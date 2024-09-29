import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/app_router.dart';
import '../../domain/entities/assignment_entity.dart';
import 'complete_assignment_widget/complete_header.dart';

class CompleteAssignmentInstructor extends StatelessWidget {
  final AssignmentInstructorEntity? assignmentEntity;
  const CompleteAssignmentInstructor({
    super.key, required this.assignmentEntity,
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
            CompleteHeader(assignmentEntity: assignmentEntity),
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
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.bookmark,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                child: Text(
                                  currentCycleName!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Row(
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
                          const SizedBox(
                            height: 2,
                          ),
                          const Row(
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
                        Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(.6),
                            borderRadius: BorderRadius.circular(12),
                            // border: Border.all(width: .5),
                          ),
                          child: const Center(
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white),
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

