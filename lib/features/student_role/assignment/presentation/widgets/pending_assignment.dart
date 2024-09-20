import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/student_role/assignment/presentation/manager/assignment_cubit.dart';

import '../../../../../core/functions/open_file.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/glass_box.dart';
import '../../domain/entities/assignment_entity.dart';


class PendingAssignment extends StatelessWidget {
  final AssignmentEntity? assignmentEntity;
  const PendingAssignment({
    super.key,required this.assignmentEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog<String>(
          context: context,
          barrierColor: Colors.black.withOpacity(.3),
          useSafeArea: true,
          builder: (BuildContext context) => AlertDialog(
            insetPadding: const EdgeInsets.all(0.0),
            scrollable: false,
            shadowColor: Colors.transparent,
            content: Center(
              child: Container(
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
                                widget: Container(
                                  height: 180,
                                  child: Padding(
                                    padding: const EdgeInsets
                                        .only(
                                        bottom: 25.0,
                                        left: 25,
                                        right: 25,
                                        top: 20
                                    ),
                                    child: Form(
                                      // key: formkey1,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              FaIcon(FontAwesomeIcons.bookmark,size: 25,),
                                              SizedBox(width: 15,),
                                              Text(
                                                assignmentEntity!.taskName??'',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium?.copyWith(fontSize: 15,color: Colors.black),

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              FaIcon(FontAwesomeIcons.chartSimple,size: 25,),
                                              SizedBox(width: 15,),
                                              Text(
                                               '${ assignmentEntity!.taskGrade??''}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium?.copyWith(fontSize: 15,color: Colors.black),

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 50,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child:
                                                    CustomButton(


                                                      text:
                                                      'Open Task', onTap: (){
                                                      // openFile(networkFile:'https://www.nabilramadan.runasp.net/Uploads/Assignments/1ba66f86-8b9a-43c4-9f4e-64ffbf45f71f.jpg' );


                                                    },
                                                    )
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),

                                                GestureDetector(
                                                  onTap: (){
                                                    // if(cubit.all_assign_files_List.isEmpty) {
                                                    //   cubit.pick_File();
                                                    // }
                                                    // else {
                                                    //   cubit.SumitTask();
                                                    //   Navigator.pop(context);
                                                    // }
                                                    // cubit.all_assign_files_List.isEmpty?
                                                  },
                                                  child: true?
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.red.withOpacity(.7),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: const Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(Icons.file_present_rounded,color: Colors.white,),
                                                          SizedBox(
                                                            width: 5,),
                                                          Text(
                                                            'Attach File' ,//: 'Done',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ): const Text(
                                                    'Done' ,//: 'Done',
                                                    style: TextStyle(
                                                      color: Colors.teal,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
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
                                ),
                                color: Colors.white
                                    .withOpacity(.5),
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
                    y: 3, border: false,),
                ),
              ),
            ),
            elevation: 0,
            clipBehavior: Clip.none,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
          ),
        );
      },
      child: Container(
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
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text('${assignmentEntity?.taskName}'),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.circleUp,
                        size: 26,
                        color: Colors.teal.withOpacity(.7),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.circleDown,
                        size: 26,
                        color: Colors.teal.withOpacity(.7),
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
                            // Row(
                            //   children: [
                            //     FaIcon(
                            //       FontAwesomeIcons.bookmark,
                            //       size: 12,
                            //     ),
                            //     SizedBox(
                            //       width: 7,
                            //     ),
                            //     Text(
                            //       '${assign?.courseName}',
                            //       textAlign: TextAlign.start,
                            //       style: TextStyle(
                            //           fontWeight: FontWeight.w700, fontSize: 13),
                            //     ),
                            //   ],
                            // ),
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
                                  FontAwesomeIcons.chartLine,
                                  size: 12,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    'From ${assignmentEntity?.startDate}',
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
                                    'to  ${assignmentEntity?.endDate}',
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
            ],
          ),
        ),
      ),
    );
  }
}
