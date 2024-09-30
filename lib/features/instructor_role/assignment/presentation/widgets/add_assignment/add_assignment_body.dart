import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

import '../../../../../../core/constants/constant.dart';
import '../../../../../../core/style/colors.dart';

class AddAssignmentBody extends StatefulWidget {
  const AddAssignmentBody({super.key});

  @override
  State<AddAssignmentBody> createState() => _AddAssignmentBodyState();
}

class _AddAssignmentBodyState extends State<AddAssignmentBody> {

  int _index = 0;
  var taskNameController = TextEditingController();
  var taskGradeController = TextEditingController();
  var stepController = ScrollController();
  var addTaskFormKey = GlobalKey<FormState>();
  List<File> files=[];
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          DefaultAppBar(context: context),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Form(
              key: addTaskFormKey,
              child: Stepper(
                currentStep: _index,
                type: StepperType.vertical,
                connectorColor: WidgetStateProperty.all(Colors.blue),
                physics: BouncingScrollPhysics(),

                elevation: 0,
                connectorThickness: 3,
                // stepIconBuilder: (stepIndex, stepState) => Container(
                //   color: Colors.green,
                //   height: 40,
                //   width: 40,
                // ),
                controller: stepController,
                controlsBuilder: (context, details) => Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          details.onStepContinue!();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          details.onStepCancel!();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueGrey.withOpacity(.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15),
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                onStepCancel: () {
                  if (_index > 0) {
                    setState(() {
                      _index -= 1;
                    });
                  }
                },
                onStepContinue: () {
                  if (_index == 2) {
                    // if (addTaskFormKey.currentState!.validate() &&
                    //     cubit.StartDate != null &&
                    //     cubit.EndDate != null &&
                    //     all_files.isNotEmpty) {
                    //   cubit.AddInsNewTask(
                    //     startDate: cubit.StartDate,
                    //     endDate: cubit.EndDate,
                    //     taskName: taskNameController.text,
                    //     taskGrade: taskGradeController.text,
                    //   );
                    //   NavigateAndFinish(
                    //     context,
                    //     Layout_Screen(),
                    //   );
                    //   // Navigator.push(context,MaterialPageRoute(builder: (context) => STU_Lecture_Screen(),));
                    //   Navigator.push(context,MaterialPageRoute(builder: (context) => STU_About_course(),));
                    //   Navigator.push(context,MaterialPageRoute(builder: (context) => INS_Assign_Screen(),));
                    //   cubit.StartDate=null;
                    //   cubit.EndDate=null;
                    // } else {
                    //   flutterToast(
                    //       msg: 'please add all data about task',
                    //       backColor: Colors.red);
                    // }
                  } else if (_index <= 0 || _index < 2) {
                    setState(() {
                      _index += 1;
                    });
                  }
                },
                onStepTapped: (int index) {
                  setState(() {
                    _index = index;
                  });
                },

                steps: [
                  Step(
                    isActive: _index >= 0,
                    state: _index >= 0
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      'Title and Discription',
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w800),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        children: [
                          GlassBox(
                              widget: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0, horizontal: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'name of task which students can see it.',
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: 60,),
                                          // Icon(Icons.add_chart,size: 30,),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        // border: Border.all(color: Colors.white),
                                        borderRadius:
                                        BorderRadius.circular(18),
                                        color: Colors.blueGrey
                                            .withOpacity(.1),
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: TextFormField(
                                          controller: taskNameController,
                                          keyboardType:
                                          TextInputType.text,
                                          onFieldSubmitted: (value) {
                                            print(value);
                                          },
                                          onChanged: (value) {
                                            print(value);
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Title can\'t be empty';
                                            }
                                            return null;
                                          },
                                          // toolbarOptions:
                                          //     ToolbarOptions(paste: true, copy: true),
                                          cursorColor: KColors.primaryColor,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons
                                                  .drive_file_rename_outline,
                                              color: KColors.primaryColor,
                                              size: 30,
                                            ),
                                            hintText: 'Task Title',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: Colors.white.withOpacity(.2),
                              borderRadius: 20,
                              x: 0,
                              y: 0, border: true,),
                          SizedBox(
                            height: 15,
                          ),
                          // GlassBoxWithBorder_Gradiant2(
                          //     widget:Padding(
                          //       padding: const EdgeInsets.all(10.0),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Padding(
                          //             padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 8),
                          //             child: Row(
                          //               crossAxisAlignment: CrossAxisAlignment.center,
                          //               mainAxisAlignment: MainAxisAlignment.center,
                          //               children: [
                          //
                          //
                          //                 Expanded(
                          //                   child: Text('Folder contain quize result for all student, only you can see that.',maxLines: 2,style: TextStyle(
                          //                     fontSize: 17,
                          //                     color: Colors.black,
                          //                     fontWeight: FontWeight.w500,
                          //                   ),),
                          //                 ),
                          //                 // SizedBox(width: 60,),
                          //                 // Icon(Icons.add_chart,size: 30,),
                          //               ],
                          //             ),
                          //           ),
                          //           Container(
                          //             alignment: Alignment.center,
                          //             height: 70,
                          //             decoration: BoxDecoration(
                          //               // border: Border.all(color: Colors.white),
                          //               borderRadius: BorderRadius.circular(18),
                          //               color: Colors.blueGrey.withOpacity(.1),
                          //             ),
                          //             child: Padding(
                          //               padding:
                          //               const EdgeInsets.symmetric(horizontal: 8.0),
                          //               child: TextFormField(
                          //
                          //                 keyboardType: TextInputType.text,
                          //                 onFieldSubmitted: (value) {
                          //                   print(value);
                          //                 },
                          //                 onChanged: (value) {
                          //                   print(value);
                          //                 },
                          //                 validator: (value) {
                          //                   if (value!.isEmpty) {
                          //                     return 'Folder name can\'t be empty';
                          //                   }
                          //                   return null;
                          //                 },
                          //                 // toolbarOptions:
                          //                 //     ToolbarOptions(paste: true, copy: true),
                          //                 cursorColor: KColors.primaryColor,
                          //                 style: const TextStyle(
                          //                   fontSize: 20,
                          //                 ),
                          //                 decoration: InputDecoration(
                          //                   prefixIcon: Icon(
                          //                     Icons.folder_open,
                          //                     color: KColors.primaryColor,
                          //                     size: 30,
                          //                   ),
                          //                   hintText: 'Folder name',
                          //                   border: InputBorder.none,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     BorderWidth: 0,
                          //     BorderColor: Colors.black,
                          //
                          //     color: Colors.white.withOpacity(.2),
                          //     borderRadius: 20,
                          //     x: 0,
                          //     y: 0),
                          // SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  ),
                  Step(
                      isActive: _index >= 1,
                      state: _index >= 1
                          ? StepState.complete
                          : StepState.disabled,
                      title: Text(
                        'Timing and points',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w800),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  GlassBox(
                                      widget: Padding(
                                        padding:
                                        const EdgeInsets.all(10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  'What about points ?',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(20),
                                                    color: Colors.blueGrey
                                                        .withOpacity(.1),
                                                  ),
                                                  child: Container(
                                                    alignment:
                                                    Alignment.center,
                                                    decoration:
                                                    BoxDecoration(
                                                      // border: Border.all(color: Colors.white),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          18),
                                                      color: Colors
                                                          .blueGrey
                                                          .withOpacity(
                                                          .1),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                          8.0),
                                                      child:
                                                      TextFormField(
                                                        controller:
                                                        taskGradeController,
                                                        keyboardType:
                                                        TextInputType
                                                            .number,
                                                        onFieldSubmitted:
                                                            (value) {
                                                          print(value);
                                                        },
                                                        onChanged:
                                                            (value) {
                                                          print(value);
                                                        },
                                                        validator:
                                                            (value) {
                                                          if (value!
                                                              .isEmpty) {
                                                            return 'Points name can\'t be empty';
                                                          }
                                                          return null;
                                                        },
                                                        // toolbarOptions:
                                                        //     ToolbarOptions(paste: true, copy: true),
                                                        cursorColor: KColors.primaryColor,
                                                        style:
                                                        const TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                        decoration:
                                                        InputDecoration(
                                                          prefixIcon:
                                                          Icon(
                                                            Icons
                                                                .add_chart,
                                                            color: KColors.primaryColor,
                                                            size: 30,
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: Colors.white.withOpacity(.2),
                                      borderRadius: 20,
                                      x: 0,
                                      y: 0, border: true,),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Container(
                              height: 200,
                              child: GlassBox(
                                  widget: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Determine Time',
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  color: Colors.white.withOpacity(.2),
                                  borderRadius: 20,
                                  x: 0,
                                  y: 0, border: true,),
                            ),
                          ],
                        ),
                      )),
                  Step(
                    isActive: _index == 2,
                    state: _index == 2
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      'Upload assignment',
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w800),
                    ),
                    content: Container(
                      height: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: GlassBox(
                                widget: Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                    // color: Colors.blueGrey.withOpacity(.05),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    border: Border.all(width: .5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0,
                                        right: 15,
                                        bottom: 10,
                                        left: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                '${taskNameController.text}'),
                                            Spacer(),
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                // color: Colors.yellow.withOpacity(.9),
                                                border: Border.all(
                                                  width: .8,
                                                  color: Colors.grey
                                                      .withOpacity(1),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: FaIcon(
                                                  FontAwesomeIcons.pen,
                                                  size: 15,
                                                  color: Colors.grey
                                                      .withOpacity(1),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                // color: Colors.red.withOpacity(.6),
                                                border: Border.all(
                                                  width: .8,
                                                  color: Colors.grey
                                                      .withOpacity(1),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .trashCan,
                                                  size: 15,
                                                  color: Colors.grey
                                                      .withOpacity(1),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                // color: Colors.teal.withOpacity(.6),
                                                border: Border.all(
                                                  width: .8,
                                                  color: Colors.grey
                                                      .withOpacity(1),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: FaIcon(
                                                  FontAwesomeIcons.eye,
                                                  size: 15,
                                                  color: Colors.grey
                                                      .withOpacity(1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          color: Colors.black
                                              .withOpacity(.3),
                                          height: .5,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 5.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .bookmark,
                                                            size: 12,
                                                          ),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          Text(
                                                            currentCycleName!,
                                                            textAlign:
                                                            TextAlign
                                                                .start,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontSize:
                                                                13),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Row(
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .chartLine,
                                                            size: 12,
                                                          ),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          Text(
                                                            '${taskGradeController.text} points',
                                                            textAlign:
                                                            TextAlign
                                                                .start,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontSize:
                                                                13),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Row(
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .clock,
                                                            size: 12,
                                                          ),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          // Text(cubit.StartDate==null?'':
                                                          // 'Start   ${DateTime.parse(cubit.StartDate!).day}/${DateTime.parse(cubit.StartDate!).month}'
                                                          //     '   ${DateTime.parse(cubit.StartDate!).hour }:${DateTime.parse(cubit.StartDate!).minute}',
                                                          //   textAlign:
                                                          //   TextAlign
                                                          //       .start,
                                                          //   style: TextStyle(
                                                          //       fontWeight:
                                                          //       FontWeight
                                                          //           .w700,
                                                          //       fontSize:
                                                          //       13),
                                                          // ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Row(
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .clock,
                                                            size: 12,
                                                          ),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          // Text( cubit.EndDate==null?'':
                                                          // 'End   ${DateTime.parse(cubit.EndDate!).day}/${DateTime.parse(cubit.EndDate!).month}'
                                                          //     '   ${DateTime.parse(cubit.EndDate!).hour }:${DateTime.parse(cubit.EndDate!).minute}',
                                                          //   textAlign:
                                                          //   TextAlign
                                                          //       .start,
                                                          //   style: TextStyle(
                                                          //       fontWeight:
                                                          //       FontWeight
                                                          //           .w700,
                                                          //       fontSize:
                                                          //       13),
                                                          // ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      height: 45,
                                                      width:
                                                      double.infinity,
                                                      decoration:
                                                      BoxDecoration(
                                                        color: Colors.teal
                                                            .withOpacity(
                                                            .6),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        // border: Border.all(width: .5),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Edit',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              fontSize:
                                                              20,
                                                              color: Colors
                                                                  .white),
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
                                color: Colors.white.withOpacity(.2),
                                borderRadius: 20,
                                x: 0,
                                y: 0, border: true,),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // all_files.isNotEmpty
                      true
                              ? BuildAssignFileViewWidget(
                              0, context, files[0])
                              : InkWell(
                            onTap: () {
                              // if (all_files.isEmpty) {
                              //   cubit.pick_File();
                              // }
                            },
                            child: GlassBox(
                                widget: Container(
                                  height: 150,
                                  width: 150,
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey
                                                  .withOpacity(.3),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  12),
                                            ),
                                            child: FaIcon(
                                              FontAwesomeIcons.plus,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        child: const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          children: [
                                            Icon(
                                              Icons
                                                  .file_present_rounded,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Attach File', //: 'Done',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                color: Colors.white.withOpacity(.2),
                                borderRadius: 20,
                                x: 0,
                                y: 0, border: true,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget BuildAssignFileViewWidget(
    index,
    context,
    File file,
    ) {
  final kb = file.lengthSync() / 1024;
  final mb = kb / 1024;
  final fileSize =
  mb >= 1 ? '${mb.toStringAsFixed(2)} MB ' : '${kb.toStringAsFixed(2)} KB';
  final extension = file.path.split('.').last ?? '';
  final color = Colors.blueGrey.withOpacity(.5);
  return InkWell(
    // onTap: () => App_cubit.get(context).openFile_Fun(file: file),
    child: GlassBox(
        widget: Container(
          width: 140,
          height: 140,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '.$extension',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 8,
              ),
              Text(
                file.path.split('/').last,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                fileSize,
                //fileSize,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
        color: Colors.white.withOpacity(.2),
        borderRadius: 20,
        x: 0,
        y: 0, border: true,),
  );
}