import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/entities/assignment_entity.dart';

class CompleteAssignment extends StatelessWidget {
  final AssignmentEntity? assignmentEntity;
  const CompleteAssignment({
    super.key, required this.assignmentEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      decoration: BoxDecoration(
        // color: Colors.blueGrey.withOpacity(.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .5),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left: 15),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text('${assignmentEntity?.taskName}'),
                const Spacer(),
                const SizedBox(
                  width: 7,
                ),
                InkWell(
                  onTap: () {
                    // Alrat(
                    //     context: context,
                    //     no: () {
                    //       Navigator.pop(context);
                    //     },
                    //     text: 'Do you want to delete Task ?',
                    //     yes: () {
                    //       App_cubit.get(context).INS_Delete_Assign(Taskid: assign!.taskId);
                    //       Navigator.pop(context);
                    //
                    //     });
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: 26,
                        color: Colors.teal.withOpacity(.7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                              Text(
                                '${assignmentEntity?.courseName}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.user,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                '${assignmentEntity?.instructorName}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.chartLine,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                '${assignmentEntity?.taskGrade}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.clock,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'Ended ${assignmentEntity?.startDate}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Colors.red),
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
                          onTap: () {},
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
                                'Completed',
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
          ],
        ),
      ),
    );
  }
}