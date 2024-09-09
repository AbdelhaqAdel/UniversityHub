// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class AssignmentScreen extends StatelessWidget {
//   const AssignmentScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Number of tabs
//       initialIndex: 0,
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(height: 30,),
//               defaultAppbar(
//                   text: "cubit.currentCourseName",
//                   context:context),
//               const SizedBox(height: 30,),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   // height: 200,
//                   // width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: const RadialGradient(
//                       radius: 1.1,
//                       center: Alignment.topRight,
//                       colors: [
//                         Colors.blue,
//                         Colors.indigo
//                         //HexColor('051875FF'),
//                       ],
//                     ),
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'You are a super warrior !',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 17),
//                             ),
//                             const SizedBox(height: 20),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 18,
//                                   width: 18,
//                                   decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: const Icon(
//                                     FontAwesomeIcons.check,
//                                     size: 14,
//                                     color: Colors.indigo,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 8,
//                                 ),
//                                 Text(
//                                   'Done 4 task today',
//                                   style: TextStyle(
//                                       color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 8,
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 18,
//                                   width: 18,
//                                   decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: const Icon(
//                                     FontAwesomeIcons.check,
//                                     size: 14,
//                                     color: Colors.indigo,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 8,
//                                 ),
//                                 Text(
//                                   'Done 10 task yesterday',
//                                   style: TextStyle(
//                                       color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 8,
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 18,
//                                   width: 18,
//                                   decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: const Icon(
//                                     FontAwesomeIcons.check,
//                                     size: 14,
//                                     color: Colors.indigo,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 8,
//                                 ),
//                                 Text(
//                                   'Done 100 task last month',
//                                   style: TextStyle(
//                                       color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         //Spacer(),
//                         const Expanded(
//                           child: Image(
//                             height: 120,
//                             width: 120,
//                             image: AssetImage('assets/images/R.png'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//               TabBar(
//                 onTap: (index) {
//                   // cubit.Tab_Bar_3_Function(index: index);
//                 },
//                 indicatorColor:
//                 true? Colors.red : Colors.teal,
//                 indicatorWeight: 5,
//                 splashBorderRadius: BorderRadius.circular(25),
//                 indicatorSize: TabBarIndicatorSize.label,
//                 splashFactory: NoSplash.splashFactory,
//                 tabs: [
//                   Tab(
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // FaIcon(
//                         //   FontAwesomeIcons.clock,
//                         //   color: cubit.Tab_Bar_3_index == 0
//                         //       ? Colors.red
//                         //       : Colors.black.withOpacity(.6),
//                         //   size: cubit.Tab_Bar_3_index == 0 ? 25 : 22,
//                         // ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           'Pending',
//                           // style: TextStyle(
//                           //   fontSize: cubit.Tab_Bar_3_index == 0 ? 20 : 18,
//                           //   color: cubit.Tab_Bar_3_index == 0
//                           //       ? Colors.red
//                           //       : Colors.black.withOpacity(.6),
//                           // ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Tab(
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // FaIcon(
//                         //   FontAwesomeIcons.circleCheck,
//                         //   color: cubit.Tab_Bar_3_index == 1
//                         //       ? Colors.teal
//                         //       : Colors.black.withOpacity(.6),
//                         //   size: cubit.Tab_Bar_3_index == 1 ? 25 : 22,
//                         // ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           'Complete',
//                           // style: TextStyle(
//                           //   fontSize: cubit.Tab_Bar_3_index == 1 ? 20 : 18,
//                           //   color: cubit.Tab_Bar_3_index == 1
//                           //       ? Colors.teal
//                           //       : Colors.black.withOpacity(.6),
//                           // ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Expanded(
//                 child: ConditionalBuilder(condition: true,
//                   builder: (context) =>Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Container(
//                       height: 500,
//                       child: ConditionalBuilder(
//                         condition:true,
//                         builder:(context)=> ListView.separated(
//                           physics: const BouncingScrollPhysics(),
//                           itemBuilder:(context,index)=>InkWell(
//                               onTap: (){
//                                 // cubit.assignName=assign[index].taskName;
//                                 // cubit.assignFile=null;
//                                 // cubit.taskId=assign[index].taskId;
//                                 // cubit.all_assign_files_List=[];
//                                 // cubit.StuGetAssignData();
//                                 // navigateTo(context,STU_About_Assign_Screen() );
//                               },
//                               child: STU_pend_Tasks(assign:assign[index] )),
//                           separatorBuilder: (context,index)=>const SizedBox(height: 10,),
//                           itemCount:1,
//                         ),
//                         fallback:(context)=> Center(child: CircularProgressIndicator(),),
//                       ),
//                     ),
//                   ) ,
//                   fallback: (context) => Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Container(
//                       height:500,
//                       child: ListView.separated(
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder:(context,index)=>InkWell(
//                             onTap: (){
//                               // navigateTo(context,STU_Assign_Screen() );
//                             },
//                             child: STU_complete_Tasks(assign: cubit.stuCoursesAssign_Completed_Model[index])),
//                         separatorBuilder: (context,index)=>const SizedBox(height: 10,),
//                         itemCount: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }
//
//
// Widget defaultAppbar({
//   String? text,
//   context,
// })=>Stack(
//     alignment: FractionalOffset.center,
//
//     children: [
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 30.0),
// child: GestureDetector(
// onTap:(){
// Navigator.pop(context);
// },
// child: FaIcon(FontAwesomeIcons.angleLeft,size: 30)),
// ),
//
// ],
// ),
// Center(
// child:Padding(
// padding: const EdgeInsets.only(left: 80.0,right: 40),
// child: Text(
// text??'',overflow: TextOverflow.ellipsis,maxLines: 1,
//
// textAlign: TextAlign.center,
// style: TextStyle(
// fontWeight: FontWeight.w700, color: Colors.white, fontSize: 20
// ),
// ),
// ),
// ),],);
//
//
//
// //----------------------------------------
// Widget STU_pend_Tasks({STU_Course_Assign_Model? assign}) => Container(
//   height: 155,
//   decoration: BoxDecoration(
//     // color: Colors.blueGrey.withOpacity(.05),
//     borderRadius: BorderRadius.circular(20),
//     border: Border.all(width: .5),
//   ),
//   child: Padding(
//     padding:
//     const EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left: 15),
//     child: Column(
//       children: [
//         Row(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 10,
//             ),
//             Text('${assign?.taskName}'),
//             Spacer(),
//             Container(
//               height: 30,
//               width: 30,
//               child: Center(
//                 child: FaIcon(
//                   FontAwesomeIcons.circleUp,
//                   size: 26,
//                   color: Colors.teal.withOpacity(.7),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 7,
//             ),
//             Container(
//               height: 30,
//               width: 30,
//               child: Center(
//                 child: FaIcon(
//                   FontAwesomeIcons.circleDown,
//                   size: 26,
//                   color: Colors.teal.withOpacity(.7),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 7,
//         ),
//         Container(
//           color: Colors.black.withOpacity(.3),
//           height: .5,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Expanded(
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 5.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Row(
//                       //   children: [
//                       //     FaIcon(
//                       //       FontAwesomeIcons.bookmark,
//                       //       size: 12,
//                       //     ),
//                       //     SizedBox(
//                       //       width: 7,
//                       //     ),
//                       //     Text(
//                       //       '${assign?.courseName}',
//                       //       textAlign: TextAlign.start,
//                       //       style: TextStyle(
//                       //           fontWeight: FontWeight.w700, fontSize: 13),
//                       //     ),
//                       //   ],
//                       // ),
//                       SizedBox(
//                         height: 2,
//                       ),
//                       Row(
//                         children: [
//                           FaIcon(
//                             FontAwesomeIcons.user,
//                             size: 12,
//                           ),
//                           SizedBox(
//                             width: 7,
//                           ),
//                           Text(
//                             '${assign?.taskGrade}',
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 13),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 2,
//                       ),
//                       Row(
//                         children: [
//                           FaIcon(
//                             FontAwesomeIcons.chartLine,
//                             size: 12,
//                           ),
//                           SizedBox(
//                             width: 7,
//                           ),
//                           Container(
//                             width: 150,
//                             child: Text(
//                               'From ${assign?.startDate}',
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 13),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 2,
//                       ),
//                       Row(
//                         children: [
//                           FaIcon(
//                             FontAwesomeIcons.clock,
//                             size: 12,
//                           ),
//                           SizedBox(
//                             width: 7,
//                           ),
//                           Container(
//                             width: 150,
//                             child: Text(
//                               'to  ${assign?.endDate}',
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 13),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {},
//                       child: Container(
//                         height: 45,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.teal.withOpacity(.6),
//                           borderRadius: BorderRadius.circular(12),
//                           // border: Border.all(width: .5),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Available',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 20,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// );
//
// Widget STU_complete_Tasks({required STU_Course_Assign_Model? assign}) =>
//     Container(
//       height: 155,
//       decoration: BoxDecoration(
//         // color: Colors.blueGrey.withOpacity(.05),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(width: .5),
//       ),
//       child: Padding(
//         padding:
//         const EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left: 15),
//         child: Column(
//           children: [
//             Row(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text('${assign?.taskName}'),
//                 Spacer(),
//                 SizedBox(
//                   width: 7,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Alrat(
//                     //     context: context,
//                     //     no: () {
//                     //       Navigator.pop(context);
//                     //     },
//                     //     text: 'Do you want to delete Task ?',
//                     //     yes: () {
//                     //       App_cubit.get(context).INS_Delete_Assign(Taskid: assign!.taskId);
//                     //       Navigator.pop(context);
//                     //
//                     //     });
//                   },
//                   child: Container(
//                     height: 30,
//                     width: 30,
//                     child: Center(
//                       child: FaIcon(
//                         FontAwesomeIcons.circleCheck,
//                         size: 26,
//                         color: Colors.teal.withOpacity(.7),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 7,
//             ),
//             Container(
//               color: Colors.black.withOpacity(.3),
//               height: .5,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 5.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               FaIcon(
//                                 FontAwesomeIcons.bookmark,
//                                 size: 12,
//                               ),
//                               SizedBox(
//                                 width: 7,
//                               ),
//                               Text(
//                                 '${assign?.courseName}',
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700, fontSize: 13),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 2,
//                           ),
//                           Row(
//                             children: [
//                               FaIcon(
//                                 FontAwesomeIcons.user,
//                                 size: 12,
//                               ),
//                               SizedBox(
//                                 width: 7,
//                               ),
//                               Text(
//                                 '${assign?.instructorName}',
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700, fontSize: 13),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 2,
//                           ),
//                           Row(
//                             children: [
//                               FaIcon(
//                                 FontAwesomeIcons.chartLine,
//                                 size: 12,
//                               ),
//                               SizedBox(
//                                 width: 7,
//                               ),
//                               Text(
//                                 '${assign?.taskGrade}',
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700, fontSize: 13),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 2,
//                           ),
//                           Row(
//                             children: [
//                               FaIcon(
//                                 FontAwesomeIcons.clock,
//                                 size: 12,
//                               ),
//                               SizedBox(
//                                 width: 7,
//                               ),
//                               Container(
//                                 width: 150,
//                                 child: Text(
//                                   'Ended ${assign?.startDate}',
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 1,
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 13,
//                                       color: Colors.red),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             height: 45,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: Colors.teal.withOpacity(.6),
//                               borderRadius: BorderRadius.circular(12),
//                               // border: Border.all(width: .5),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 'Completed',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 20,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );