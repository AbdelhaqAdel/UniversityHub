import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import '../../../../../../core/constants/constant.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/glass_box.dart';
import '../../../domain/entities/student_task_uploaded_entity.dart';
import '../../manager/assignment_cubit.dart';

final List studentUploadedTask=[];
class TaskResult extends StatelessWidget {
  const TaskResult({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentInstructorCubit, AssignmentInstructorState>(
      listener: (context, state) {},
      builder: (context, state) {
        AssignmentInstructorCubit cubit=AssignmentInstructorCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                DefaultAppBar(text: currentCycleName, context: context),
                const SizedBox(height: 30,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.solidUser,color: Colors.teal,size: 18,),
                            SizedBox(width: 15,),
                            Container(
                                child: Text(
                                  'Student name',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Colors.teal,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )),
                            Spacer(),
                            // Container(
                            //     child: Text(
                            //       'Upload at',
                            //       textAlign: TextAlign.center,
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .bodySmall
                            //           ?.copyWith(
                            //         color: Colors.teal,
                            //         fontSize: 15,
                            //         fontWeight: FontWeight.w900,
                            //       ),
                            //     )),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 2,
                          color: Colors.teal,
                          width: double.infinity,
        
                        ),
                        SizedBox(height: 20,),
        
                        Container(
                          height: 150,
                          child: ListView.separated(
                            itemBuilder:(context,index)=> CheckStudentTask(
                              taskId: taskId,
        
        
                                index: index+1,
                                context: context,
                                studentTaskUploadedEntity:studentUploadedTask[index]
                            ),
                            separatorBuilder: (context,index)=>  Container(
                              height: 1,
                              color: Colors.teal,
                              width: double.infinity,
        
                            ),
                            itemCount:studentUploadedTask.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        
        
        
              ],
            ),
          ),
        
        );
      },
    );
}}

var puttaskGradecontroller = TextEditingController();
Widget CheckStudentTask({
  int? index,
  required context,
  StudentTaskUploadedEntity? studentTaskUploadedEntity,
  required String taskId,
}) =>
    Container(
      child: Row(
        children: [
          Text(
            '$index.  ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '${studentTaskUploadedEntity?.studentName}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          InkWell(
            onTap: () {
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
                                          height: 290,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 25.0,
                                                left: 25,
                                                right: 25,
                                                top: 20),
                                            child: Form(
                                              // key: formkey1,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${studentTaskUploadedEntity?.studentName}',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      // border: Border.all(color: Colors.white),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          18),
                                                      color: Colors.blueGrey
                                                          .withOpacity(.25),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          FaIcon(
                                                              FontAwesomeIcons
                                                                  .clock),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '${studentTaskUploadedEntity?.timeUploaded}',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          // width: 150,

                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              vertical: 5,
                                                              horizontal:
                                                              10),
                                                          alignment:
                                                          Alignment.center,
                                                          height: 60,
                                                          decoration:
                                                          BoxDecoration(
                                                            // border: Border.all(color: Colors.white),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                18),
                                                            color: Colors.white
                                                                .withOpacity(
                                                                .5),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                0.0),
                                                            child:
                                                            TextFormField(
                                                              controller:
                                                              puttaskGradecontroller,
                                                              keyboardType:
                                                              TextInputType
                                                                  .number,
                                                              onFieldSubmitted:
                                                                  (value) {
                                                                print(value);
                                                              },
                                                              //validator:
                                                              //     (value) {
                                                              //   if (value!
                                                              //       .isEmpty) {
                                                              //     return 'Event title can\'t be empty';
                                                              //   }
                                                              //   return null;
                                                              // },
                                                              // toolbarOptions:
                                                              //     ToolbarOptions(paste: true, copy: true),
                                                              cursorColor: Colors.white,
                                                              style:
                                                              const TextStyle(
                                                                fontSize: 18,
                                                              ),
                                                              decoration:
                                                              InputDecoration(
                                                                prefixIcon:
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      10.0,
                                                                      vertical:
                                                                      10),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .solidEdit,
                                                                    color: Colors.white,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                                hintText:
                                                                'Points',
                                                                border:
                                                                InputBorder
                                                                    .none,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
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
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            alignment: Alignment
                                                                .center,
                                                            height: 60,
                                                            decoration:
                                                            BoxDecoration(
                                                              // border: Border.all(color: Colors.white),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  18),
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                  .5),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                  0.0),
                                                              child: Container(
                                                                  child: Row(
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
                                                                          fontSize:
                                                                          18,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 15,
                                                  ),

                                                  CustomButton(
                                                      onTap: () {
                                                        // print('ss');
                                                        // App_cubit.get(context)
                                                        //     ?.PutgradeINSAssign(
                                                        //     grade: int.parse(
                                                        //         puttaskGradecontroller
                                                        //             .text),
                                                        //     examId: taskId,
                                                        //     studentId:
                                                        //     studentTaskUploadedEntity!
                                                        //         .studentId);
                                                        // Navigator.pop(context);
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.teal, width: 2)),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 1.0, horizontal: 6),
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
      ),
    );
