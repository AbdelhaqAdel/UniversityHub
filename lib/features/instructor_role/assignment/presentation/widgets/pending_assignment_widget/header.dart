import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/widgets/glass_box.dart';
import '../../../domain/entities/assignment_entity.dart';

class PendingHeader extends StatelessWidget {
  const PendingHeader({
    super.key,
    required this.assignmentEntity,
  });

  final AssignmentInstructorEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text('${assignmentEntity?.taskName}'),
        const Spacer(),
        const Spacer(),
        InkWell(
          onTap: () {
            Alrat(
                context: context,
                no: () {
                  Navigator.pop(context);
                },
                text: 'Do you want to edit Task ?',
                yes: () {
                  // Navigator.pop(context);
                  // print(assign!.taskId);
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
                  //                         padding: const EdgeInsets.all(15.0),
                  //                         child: GlassBoxWithBorder(
                  //                           widget: Container(
                  //                             height: 420,
                  //                             child: Padding(
                  //                               padding: const EdgeInsets.only(
                  //                                   bottom: 25.0,
                  //                                   left: 25,
                  //                                   right: 25,
                  //                                   top: 20),
                  //                               child: Form(
                  //                                 key: formkey1,
                  //                                 child: Column(
                  //                                   children: [
                  //                                     const Spacer(),
                  //                                     SizedBox(
                  //                                       height: 15,
                  //                                     ),
                  //                                     Container(
                  //                                       padding: EdgeInsets
                  //                                           .symmetric(
                  //                                               vertical: 5,
                  //                                               horizontal: 10),
                  //                                       alignment:
                  //                                           Alignment.center,
                  //                                       height: 60,
                  //                                       decoration:
                  //                                           BoxDecoration(
                  //                                         // border: Border.all(color: Colors.white),
                  //                                         borderRadius:
                  //                                             BorderRadius
                  //                                                 .circular(18),
                  //                                         color: Colors.white
                  //                                             .withOpacity(.5),
                  //                                       ),
                  //                                       child: Padding(
                  //                                         padding:
                  //                                             const EdgeInsets
                  //                                                 .symmetric(
                  //                                                 horizontal:
                  //                                                     0.0),
                  //                                         child: TextFormField(
                  //                                           controller:
                  //                                               taskNamecontroller,
                  //                                           keyboardType:
                  //                                               TextInputType
                  //                                                   .text,
                  //                                           onFieldSubmitted:
                  //                                               (value) {
                  //                                             print(value);
                  //                                           },
                  //                                           // validator:
                  //                                           //     (value) {
                  //                                           //   if (value!
                  //                                           //       .isEmpty) {
                  //                                           //     return 'Event title can\'t be empty';
                  //                                           //   }
                  //                                           //   return null;
                  //                                           // },
                  //                                           // toolbarOptions:
                  //                                           //     ToolbarOptions(paste: true, copy: true),
                  //                                           cursorColor: c1,
                  //                                           style:
                  //                                               const TextStyle(
                  //                                             fontSize: 18,
                  //                                           ),
                  //                                           decoration:
                  //                                               InputDecoration(
                  //                                             prefixIcon:
                  //                                                 Padding(
                  //                                               padding: const EdgeInsets
                  //                                                   .symmetric(
                  //                                                   horizontal:
                  //                                                       10.0,
                  //                                                   vertical:
                  //                                                       10),
                  //                                               child: FaIcon(
                  //                                                 FontAwesomeIcons
                  //                                                     .edit,
                  //                                                 color: c1,
                  //                                                 size: 25,
                  //                                               ),
                  //                                             ),
                  //                                             hintText:
                  //                                                 'Task name',
                  //                                             border:
                  //                                                 InputBorder
                  //                                                     .none,
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                     SizedBox(
                  //                                       height: 15,
                  //                                     ),
                  //                                     Container(
                  //                                       padding: EdgeInsets
                  //                                           .symmetric(
                  //                                               vertical: 5,
                  //                                               horizontal: 10),
                  //                                       alignment:
                  //                                           Alignment.center,
                  //                                       height: 60,
                  //                                       decoration:
                  //                                           BoxDecoration(
                  //                                         // border: Border.all(color: Colors.white),
                  //                                         borderRadius:
                  //                                             BorderRadius
                  //                                                 .circular(18),
                  //                                         color: Colors.white
                  //                                             .withOpacity(.5),
                  //                                       ),
                  //                                       child: Padding(
                  //                                         padding:
                  //                                             const EdgeInsets
                  //                                                 .symmetric(
                  //                                                 horizontal:
                  //                                                     0.0),
                  //                                         child: TextFormField(
                  //                                           controller:
                  //                                               taskGradecontroller,
                  //                                           keyboardType:
                  //                                               TextInputType
                  //                                                   .text,
                  //                                           onFieldSubmitted:
                  //                                               (value) {
                  //                                             print(value);
                  //                                           },
                  //                                           //validator:
                  //                                           //     (value) {
                  //                                           //   if (value!
                  //                                           //       .isEmpty) {
                  //                                           //     return 'Event title can\'t be empty';
                  //                                           //   }
                  //                                           //   return null;
                  //                                           // },
                  //                                           // toolbarOptions:
                  //                                           //     ToolbarOptions(paste: true, copy: true),
                  //                                           cursorColor: c1,
                  //                                           style:
                  //                                               const TextStyle(
                  //                                             fontSize: 18,
                  //                                           ),
                  //                                           decoration:
                  //                                               InputDecoration(
                  //                                             prefixIcon:
                  //                                                 Padding(
                  //                                               padding: const EdgeInsets
                  //                                                   .symmetric(
                  //                                                   horizontal:
                  //                                                       10.0,
                  //                                                   vertical:
                  //                                                       10),
                  //                                               child: FaIcon(
                  //                                                 FontAwesomeIcons
                  //                                                     .solidEdit,
                  //                                                 color: c1,
                  //                                                 size: 25,
                  //                                               ),
                  //                                             ),
                  //                                             hintText:
                  //                                                 'Task grade',
                  //                                             border:
                  //                                                 InputBorder
                  //                                                     .none,
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                     SizedBox(
                  //                                       height: 15,
                  //                                     ),
                  //                                     Container(
                  //                                       height: 60,
                  //                                       child: GestureDetector(
                  //                                         onTap: () {
                  //                                           showDatePicker(
                  //                                             context: context,
                  //                                             initialDate:
                  //                                                 DateTime
                  //                                                     .now(),
                  //                                             firstDate:
                  //                                                 DateTime(
                  //                                                     2022),
                  //                                             lastDate:
                  //                                                 DateTime(
                  //                                                     2025),
                  //                                             builder: (BuildContext
                  //                                                     context,
                  //                                                 Widget?
                  //                                                     child) {
                  //                                               return Theme(
                  //                                                 data: ThemeData
                  //                                                         .dark()
                  //                                                     .copyWith(
                  //                                                   colorScheme:
                  //                                                       ColorScheme.dark()
                  //                                                           .copyWith(
                  //                                                     primary:
                  //                                                         Colors
                  //                                                             .blue, // Change the primary color as needed
                  //                                                   ),
                  //                                                 ),
                  //                                                 child: child!,
                  //                                               );
                  //                                             },
                  //                                           ).then(
                  //                                               (selectedDate) {
                  //                                             Navigator.of(
                  //                                                     context)
                  //                                                 .push(
                  //                                               showPicker(
                  //                                                 context:
                  //                                                     context,
                  //                                                 value: time,
                  //                                                 sunrise: TimeOfDay(
                  //                                                     hour: 6,
                  //                                                     minute:
                  //                                                         0), // optional
                  //                                                 sunset: TimeOfDay(
                  //                                                     hour: 18,
                  //                                                     minute:
                  //                                                         0), // optional
                  //                                                 duskSpanInMinutes:
                  //                                                     120, // optional
                  //
                  //                                                 borderRadius:
                  //                                                     25,
                  //                                                 accentColor:
                  //                                                     Colors
                  //                                                         .blue,
                  //                                                 blurredBackground:
                  //                                                     true,
                  //                                                 elevation: 0,
                  //
                  //                                                 is24HrFormat:
                  //                                                     false,
                  //                                                 onCancel: () {
                  //                                                   Navigator.pop(
                  //                                                       context);
                  //                                                 },
                  //                                                 onChange:
                  //                                                     (value) {
                  //                                                   startminutes =
                  //                                                       value
                  //                                                           .minute;
                  //                                                   starthours =
                  //                                                       value
                  //                                                           .hour;
                  //                                                 },
                  //                                                 // onChangeDateTime: (){},
                  //                                               ),
                  //                                             )
                  //                                                 .then(
                  //                                                     (value) {
                  //                                               if (selectedDate !=
                  //                                                   null) {
                  //                                                 DateTime
                  //                                                     selectedDateTime =
                  //                                                     DateTime(
                  //                                                   selectedDate
                  //                                                       .year,
                  //                                                   selectedDate
                  //                                                       .month,
                  //                                                   selectedDate
                  //                                                       .day,
                  //                                                   starthours!,
                  //                                                   startminutes!,
                  //                                                 );
                  //                                                 print(
                  //                                                     'Selected date and time: $selectedDateTime');
                  //                                                 App_cubit.get(
                  //                                                         context)
                  //                                                     .StartDate_Function(
                  //                                                         time:
                  //                                                             DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(selectedDateTime));
                  //                                                 print(
                  //                                                     '2024-03-23T22:31:30.911Z');
                  //                                                 // Handle the selected date and time as needed
                  //                                               }
                  //                                             });
                  //                                           });
                  //                                         },
                  //                                         child: Container(
                  //                                           decoration:
                  //                                               BoxDecoration(
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(
                  //                                                         20),
                  //                                             color: Colors.teal
                  //                                                 .withOpacity(
                  //                                                     .5),
                  //                                           ),
                  //                                           child: Padding(
                  //                                             padding:
                  //                                                 const EdgeInsets
                  //                                                     .symmetric(
                  //                                                     horizontal:
                  //                                                         15.0),
                  //                                             child: Row(
                  //                                               mainAxisAlignment:
                  //                                                   MainAxisAlignment
                  //                                                       .start,
                  //                                               children: [
                  //                                                 FaIcon(
                  //                                                     FontAwesomeIcons
                  //                                                         .clock),
                  //                                                 SizedBox(
                  //                                                   width: 12,
                  //                                                 ),
                  //                                                 Text(
                  //                                                   'Start',
                  //                                                   style:
                  //                                                       TextStyle(
                  //                                                     fontSize:
                  //                                                         22,
                  //                                                     color: Colors
                  //                                                         .black
                  //                                                         .withOpacity(
                  //                                                             .7),
                  //                                                     fontWeight:
                  //                                                         FontWeight
                  //                                                             .w700,
                  //                                                   ),
                  //                                                 ),
                  //                                                 Spacer(),
                  //                                                 Container(
                  //                                                   decoration:
                  //                                                       BoxDecoration(
                  //                                                     borderRadius:
                  //                                                         BorderRadius.circular(
                  //                                                             15),
                  //                                                     color: Colors
                  //                                                         .white
                  //                                                         .withOpacity(
                  //                                                             .3),
                  //                                                   ),
                  //                                                   child:
                  //                                                       Padding(
                  //                                                     padding: const EdgeInsets
                  //                                                         .symmetric(
                  //                                                         vertical:
                  //                                                             8.0,
                  //                                                         horizontal:
                  //                                                             15),
                  //                                                     child:
                  //                                                         Row(
                  //                                                       children: [
                  //                                                         Text(
                  //                                                           App_cubit.get(context).StartDate == null
                  //                                                               ? '-- : --'
                  //                                                               : '${DateTime.parse(App_cubit.get(context).StartDate!).hour} / ${DateTime.parse(App_cubit.get(context).StartDate!).minute}',
                  //                                                           style:
                  //                                                               TextStyle(
                  //                                                             fontSize: 18,
                  //                                                             color: Colors.black,
                  //                                                             fontWeight: FontWeight.w600,
                  //                                                           ),
                  //                                                         ),
                  //                                                         Text(
                  //                                                           '${''}',
                  //                                                           style:
                  //                                                               TextStyle(
                  //                                                             fontSize: 13,
                  //                                                             color: Colors.black,
                  //                                                             fontWeight: FontWeight.w800,
                  //                                                           ),
                  //                                                         ),
                  //                                                       ],
                  //                                                     ),
                  //                                                   ),
                  //                                                 ),
                  //                                                 SizedBox(
                  //                                                   width: 10,
                  //                                                 ),
                  //                                                 Container(
                  //                                                   decoration:
                  //                                                       BoxDecoration(
                  //                                                     borderRadius:
                  //                                                         BorderRadius.circular(
                  //                                                             15),
                  //                                                     color: Colors
                  //                                                         .white
                  //                                                         .withOpacity(
                  //                                                             .3),
                  //                                                   ),
                  //                                                   child:
                  //                                                       Padding(
                  //                                                     padding: const EdgeInsets
                  //                                                         .symmetric(
                  //                                                         vertical:
                  //                                                             8.0,
                  //                                                         horizontal:
                  //                                                             15),
                  //                                                     child:
                  //                                                         Row(
                  //                                                       children: [
                  //                                                         Text(
                  //                                                           App_cubit.get(context).StartDate == null
                  //                                                               ? '-- / --'
                  //                                                               : '${DateTime.parse(App_cubit.get(context).StartDate!).day} / ${DateTime.parse(App_cubit.get(context).StartDate!).month}',
                  //                                                           style:
                  //                                                               TextStyle(
                  //                                                             fontSize: 18,
                  //                                                             color: Colors.black,
                  //                                                             fontWeight: FontWeight.w600,
                  //                                                           ),
                  //                                                         ),
                  //                                                       ],
                  //                                                     ),
                  //                                                   ),
                  //                                                 ),
                  //                                               ],
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                     SizedBox(
                  //                                       height: 10,
                  //                                     ),
                  //                                     Container(
                  //                                       height: 60,
                  //                                       child: GestureDetector(
                  //                                         onTap: () {
                  //                                           showDatePicker(
                  //                                             context: context,
                  //                                             initialDate:
                  //                                                 DateTime
                  //                                                     .now(),
                  //                                             firstDate:
                  //                                                 DateTime(
                  //                                                     2022),
                  //                                             lastDate:
                  //                                                 DateTime(
                  //                                                     2025),
                  //                                             builder: (BuildContext
                  //                                                     context,
                  //                                                 Widget?
                  //                                                     child) {
                  //                                               return Theme(
                  //                                                 data: ThemeData
                  //                                                         .dark()
                  //                                                     .copyWith(
                  //                                                   colorScheme:
                  //                                                       ColorScheme.dark()
                  //                                                           .copyWith(
                  //                                                     primary:
                  //                                                         Colors
                  //                                                             .blue,
                  //
                  //                                                     // Change the primary color as needed
                  //                                                   ),
                  //                                                 ),
                  //                                                 child: child!,
                  //                                               );
                  //                                             },
                  //                                           ).then(
                  //                                               (selectedDate) {
                  //                                             Navigator.of(
                  //                                                     context)
                  //                                                 .push(
                  //                                               showPicker(
                  //                                                 context:
                  //                                                     context,
                  //                                                 value: time,
                  //                                                 sunrise: TimeOfDay(
                  //                                                     hour: 6,
                  //                                                     minute:
                  //                                                         0), // optional
                  //                                                 sunset: TimeOfDay(
                  //                                                     hour: 18,
                  //                                                     minute:
                  //                                                         0), // optional
                  //                                                 duskSpanInMinutes:
                  //                                                     120, // optional
                  //
                  //                                                 borderRadius:
                  //                                                     25,
                  //                                                 accentColor:
                  //                                                     Colors
                  //                                                         .blue,
                  //                                                 blurredBackground:
                  //                                                     true,
                  //                                                 elevation: 0,
                  //
                  //                                                 is24HrFormat:
                  //                                                     false,
                  //                                                 onCancel: () {
                  //                                                   Navigator.pop(
                  //                                                       context);
                  //                                                 },
                  //                                                 onChange:
                  //                                                     (value) {
                  //                                                   endminutes =
                  //                                                       value
                  //                                                           .minute;
                  //                                                   endhours =
                  //                                                       value
                  //                                                           .hour;
                  //                                                 },
                  //                                                 // onChangeDateTime: (){},
                  //                                               ),
                  //                                             )
                  //                                                 .then(
                  //                                                     (value) {
                  //                                               if (selectedDate !=
                  //                                                   null) {
                  //                                                 DateTime
                  //                                                     selectedDateTime =
                  //                                                     DateTime(
                  //                                                   selectedDate
                  //                                                       .year,
                  //                                                   selectedDate
                  //                                                       .month,
                  //                                                   selectedDate
                  //                                                       .day,
                  //                                                   endhours!,
                  //                                                   endminutes!,
                  //                                                 );
                  //                                                 print(
                  //                                                     'Selected date and time: $selectedDateTime');
                  //                                                 App_cubit.get(
                  //                                                         context)
                  //                                                     .EndDate_Function(
                  //                                                         time:
                  //                                                             DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(selectedDateTime));
                  //                                                 print(
                  //                                                     '2024-03-23T22:31:30.911Z');
                  //                                                 // Handle the selected date and time as needed
                  //                                               }
                  //                                             });
                  //                                           });
                  //                                         },
                  //                                         child: Container(
                  //                                           decoration:
                  //                                               BoxDecoration(
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(
                  //                                                         20),
                  //                                             color: Colors.red
                  //                                                 .withOpacity(
                  //                                                     .5),
                  //                                           ),
                  //                                           child: Padding(
                  //                                             padding:
                  //                                                 const EdgeInsets
                  //                                                     .symmetric(
                  //                                                     horizontal:
                  //                                                         15.0),
                  //                                             child: Row(
                  //                                               mainAxisAlignment:
                  //                                                   MainAxisAlignment
                  //                                                       .start,
                  //                                               children: [
                  //                                                 FaIcon(
                  //                                                     FontAwesomeIcons
                  //                                                         .clock),
                  //                                                 SizedBox(
                  //                                                   width: 12,
                  //                                                 ),
                  //                                                 Text(
                  //                                                   'End',
                  //                                                   style:
                  //                                                       TextStyle(
                  //                                                     fontSize:
                  //                                                         22,
                  //                                                     color: Colors
                  //                                                         .black
                  //                                                         .withOpacity(
                  //                                                             .7),
                  //                                                     fontWeight:
                  //                                                         FontWeight
                  //                                                             .w700,
                  //                                                   ),
                  //                                                 ),
                  //                                                 Spacer(),
                  //                                                 Container(
                  //                                                   decoration:
                  //                                                       BoxDecoration(
                  //                                                     borderRadius:
                  //                                                         BorderRadius.circular(
                  //                                                             15),
                  //                                                     color: Colors
                  //                                                         .white
                  //                                                         .withOpacity(
                  //                                                             .3),
                  //                                                   ),
                  //                                                   child:
                  //                                                       Padding(
                  //                                                     padding: const EdgeInsets
                  //                                                         .symmetric(
                  //                                                         vertical:
                  //                                                             8.0,
                  //                                                         horizontal:
                  //                                                             15),
                  //                                                     child:
                  //                                                         Row(
                  //                                                       children: [
                  //                                                         Text(
                  //                                                           App_cubit.get(context).EndDate == null
                  //                                                               ? '-- : --'
                  //                                                               : '${DateTime.parse(App_cubit.get(context).EndDate!).hour} : ${DateTime.parse(App_cubit.get(context).EndDate!).minute}',
                  //                                                           style:
                  //                                                               TextStyle(
                  //                                                             fontSize: 18,
                  //                                                             color: Colors.black,
                  //                                                             fontWeight: FontWeight.w600,
                  //                                                           ),
                  //                                                         ),
                  //                                                         Text(
                  //                                                           '${''}',
                  //                                                           style:
                  //                                                               TextStyle(
                  //                                                             fontSize: 13,
                  //                                                             color: Colors.black,
                  //                                                             fontWeight: FontWeight.w800,
                  //                                                           ),
                  //                                                         ),
                  //                                                       ],
                  //                                                     ),
                  //                                                   ),
                  //                                                 ),
                  //                                                 SizedBox(
                  //                                                   width: 10,
                  //                                                 ),
                  //                                                 Container(
                  //                                                   decoration:
                  //                                                       BoxDecoration(
                  //                                                     borderRadius:
                  //                                                         BorderRadius.circular(
                  //                                                             15),
                  //                                                     color: Colors
                  //                                                         .white
                  //                                                         .withOpacity(
                  //                                                             .3),
                  //                                                   ),
                  //                                                   child:
                  //                                                       Padding(
                  //                                                     padding: const EdgeInsets
                  //                                                         .symmetric(
                  //                                                         vertical:
                  //                                                             8.0,
                  //                                                         horizontal:
                  //                                                             15),
                  //                                                     child:
                  //                                                         Row(
                  //                                                       children: [
                  //                                                         Text(
                  //                                                           App_cubit.get(context).EndDate == null
                  //                                                               ? '-- / --'
                  //                                                               : '${DateTime.parse(App_cubit.get(context).EndDate!).day} / ${DateTime.parse(App_cubit.get(context).EndDate!).month}',
                  //                                                           style:
                  //                                                               TextStyle(
                  //                                                             fontSize: 18,
                  //                                                             color: Colors.black,
                  //                                                             fontWeight: FontWeight.w600,
                  //                                                           ),
                  //                                                         ),
                  //                                                       ],
                  //                                                     ),
                  //                                                   ),
                  //                                                 ),
                  //                                               ],
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                     SizedBox(
                  //                                       height: 15,
                  //                                     ),
                  //                                     Default_Button(
                  //                                         onPressed: () {
                  //                                           if (formkey1
                  //                                                   .currentState!
                  //                                                   .validate() &&
                  //                                               App_cubit.get(
                  //                                                           context)
                  //                                                       .StartDate !=
                  //                                                   null &&
                  //                                               App_cubit.get(
                  //                                                           context)
                  //                                                       .EndDate !=
                  //                                                   null) {
                  //                                             App_cubit.get(
                  //                                                     context)
                  //                                                 .updateINSAssign(
                  //                                               Taskid: assign
                  //                                                   .taskId,
                  //                                               taskName:
                  //                                                   taskNamecontroller
                  //                                                       .text,
                  //                                               taskGrade:
                  //                                                   taskGradecontroller
                  //                                                       .text,
                  //                                               startDate: App_cubit
                  //                                                       .get(
                  //                                                           context)
                  //                                                   .StartDate,
                  //                                               endDate: App_cubit
                  //                                                       .get(
                  //                                                           context)
                  //                                                   .EndDate,
                  //                                             );
                  //
                  //                                             Navigator.pop(
                  //                                                 context);
                  //                                             App_cubit.get(
                  //                                                     context)
                  //                                                 .StartDate = null;
                  //                                             App_cubit.get(
                  //                                                     context)
                  //                                                 .EndDate = null;
                  //                                           }
                  //
                  //                                           //   if (formkey1.currentState!.validate()) {
                  //                                           //   cubit.AddEventToCalender(
                  //                                           //       startDate: cubit.startTime,
                  //                                           //       endDate: cubit.endTime,
                  //                                           //       eventBody: taskGradecontroller.text);
                  //                                           //   Navigator.pop(
                  //                                           //       context);
                  //                                           // } else {
                  //                                           //   flutterToast(
                  //                                           //       msg: 'please enter the event title',
                  //                                           //       backColor: Colors.red);
                  //                                           // }
                  //                                         },
                  //                                         containerHeight: 50,
                  //                                         textFontSize: 20,
                  //                                         text:
                  //                                             'Confirm changes'),
                  //                                     // SizedBox(
                  //                                     //   height: 15,
                  //                                     // ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           color: Colors.white.withOpacity(.5),
                  //                           borderRadius: 30,
                  //                           x: 15,
                  //                           y: 15,
                  //                           BorderWidth: 1,
                  //                           BorderColor: Colors.white,
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
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              // color: Colors.yellow.withOpacity(.9),
              border: Border.all(
                width: .8,
                color: Colors.blue.withOpacity(1),
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.pen,
                size: 15,
                color: Colors.blue.withOpacity(1),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        InkWell(
          onTap: () {
            Alrat(
                context: context,
                no: () {
                  Navigator.pop(context);
                },
                text: 'Do you want to delete Task ?',
                yes: () {
                  // App_cubit.get(context)
                  //     .INS_Delete_Assign(Taskid: assign!.taskId);
                  // Navigator.pop(context);
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              // color: Colors.red.withOpacity(.6),
              border: Border.all(
                width: .8,
                color: Colors.red.withOpacity(1),
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.trashCan,
                size: 15,
                color: Colors.red.withOpacity(1),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        InkWell(
          onTap: () {
            Alrat(
                context: context,
                no: () {
                  Navigator.pop(context);
                },
                text: 'Do you want to see Task ?',
                yes: () {
                  // App_cubit.get(context).openFile_Fun(
                  //     networkFile: assign?.filePath?.split('net/').last);
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              // color: Colors.teal.withOpacity(.6),
              border: Border.all(
                width: .8,
                color: Colors.teal.withOpacity(1),
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.eye,
                size: 15,
                color: Colors.teal.withOpacity(1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

