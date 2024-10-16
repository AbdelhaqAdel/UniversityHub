// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:universityhup/core/utils/assets.dart';

// class CoursesTitleCustomWidget extends StatelessWidget {
//   const CoursesTitleCustomWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0),
//                       child: Row(
//                         children: [
//                          Text(
//                             'Enrolled',
//                             style:Theme.of(context).textTheme.titleLarge, 
//                           ),
//                            SizedBox(
//                             width: 8.w,
//                           ),
//                           const Text(
//                             '5',
//                             style: TextStyle(
//                               color: Colors.teal,
//                               fontSize: 27,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                            SizedBox(
//                             width: 8.w,
//                           ),
//                            Text(
//                             'Courses',
//                             style:Theme.of(context).textTheme.titleLarge, 
//                           ),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           // Spacer(),
//                           Expanded(
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Image.asset(AssetsData.coursesBookImage),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//   }
// }