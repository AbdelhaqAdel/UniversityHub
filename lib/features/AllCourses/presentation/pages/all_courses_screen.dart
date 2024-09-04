import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/core/utils/assets.dart';
import 'package:universityhup/features/AllCourses/data/repositories/courses_repo_impl.dart';
import 'package:universityhup/features/AllCourses/presentation/manager/cubit/courses_cubit.dart';
import 'package:universityhup/features/AllCourses/presentation/widgets/courses_builder.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesCubit(coursesRepo:getIt.get<CoursesRepository>())..fetchAllCourses(),
      child: BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var screenSize=MediaQuery.of(context).size;
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     SizedBox(
                      height:screenSize.height/30 ,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0),
                      child: Row(
                        children: [
                         Text(
                            'Enrolled',
                            style:Theme.of(context).textTheme.titleLarge, 
                          ),
                           SizedBox(
                            width: 8.w,
                          ),
                          const Text(
                            '5',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           SizedBox(
                            width: 8.w,
                          ),
                           Text(
                            'Courses',
                            style:Theme.of(context).textTheme.titleLarge, 
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          // Spacer(),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AssetsData.coursesBookImage),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  const Expanded(child: CoursesBuilder()),

                    // Expanded(
                    //   child:
                    // ConditionalBuilder(
                    //     condition:
                    //         cubit.allLECFromHIVE.isEmpty || cubit.connnection,
                    //     builder: (context) => ListView.separated(
                    //       itemBuilder: (context, index) => InkWell(
                    //           onTap: () {
                    //             // print(cubit.currentCycleId);
                    //             //  print(courses[index].cycleId);
                    //             if (rol == 'Student') {
                    //               cubit.currentCourseName = courses[index].name;
                    //               cubit.currentInstructorName =
                    //                   courses[index].instructorFullName;
                    //               if (cubit.currentCycleId !=
                    //                   courses[index].cycleId) {
                    //                 cubit.stuCoursesMatrialModel = [];
                    //                 cubit.stuLECTUREModel = [];
                    //                 cubit.stuLABModel = [];
                    //                 //cubit.stuCoursesMatrialFileModel=[];
                    //                 cubit.stuCoursesAssignModel = [];
                    //                 cubit.stuCoursesQuizlModel = [];
                    //                 cubit.courseGradesModel = [];
                    //                 cubit.isCycleIdChange = true;
                    //               } else {
                    //                 cubit.isCycleIdChange = false;
                    //               }
                    //               cubit.currentCycleId =
                    //                   courses[index].cycleId!;
                    //             } else {
                    //               cubit.currentCourseName =
                    //                   insCourses[index].name;

                    //               if (cubit.currentCycleId !=
                    //                   insCourses[index].cycleId) {
                    //                 cubit.ins_Courses_Model = [];
                    //                 cubit.insLECTUREModel = [];
                    //                 cubit.insLABModel = [];
                    //                 //cubit.stuCoursesMatrialFileModel=[];
                    //                 //   cubit.stuCoursesAssignModel = [];
                    //                 //   cubit.stuCoursesQuizlModel = [];
                    //                 //    cubit.courseGradesModel = [];
                    //                 //   cubit.isCycleIdChange = true;
                    //               } else {
                    //                 cubit.isCycleIdChange = false;
                    //               }
                    //               cubit.currentCycleId =
                    //                   insCourses[index].cycleId!;
                    //             }

                    //             navigateTo(context, STU_About_course());
                    //           },
                    //           child: rol == 'Student'
                    //               ? Build_STU_Lec(
                    //                   courses: courses[index],
                    //                 )
                    //               : INS_Course(
                    //                   courses: insCourses[index],
                    //                 )),
                    //       separatorBuilder: (context, index) => const SizedBox(
                    //         height: 20,
                    //       ),
                    //       itemCount: rol == 'Student'
                    //           ? courses.length
                    //           : insCourses.length,
                    //     ),
                    //     fallback: (context) => ListView.separated(
                    //       itemBuilder: (context, index) {
                    //         if (rol == 'Doctor') {
                    //           cubit.INS_GetAllCourses_Function(
                    //             token: token,
                    //           );
                    //         }
                    //         return InkWell(
                    //             onTap: () {
                    //               cubit.currentCycleId =
                    //                   cubit.allLECFromHIVE[index].cycleId;

                    //               print(cubit.allLECFromHIVE[0].name);
                    //               print('cycle Id : ${cubit.currentCycleId}');
                    //               //  print(courses[index].cycleId);
                    //               cubit.currentCourseName =
                    //                   cubit.allLECFromHIVE[index].name;
                    //               cubit.currentInstructorName = cubit
                    //                   .allLECFromHIVE[index].instructorFullName;

                    //               if (cubit.currentCycleId !=
                    //                   cubit.allLECFromHIVE[index].cycleId) {
                    //                 cubit.stuCoursesMatrialModel = [];
                    //                 cubit.stuLECTUREModel = [];
                    //                 cubit.stuLABModel = [];
                    //                 //cubit.stuCoursesMatrialFileModel=[];
                    //                 cubit.stuCoursesAssignModel = [];
                    //                 cubit.stuCoursesQuizlModel = [];
                    //                 cubit.courseGradesModel = [];
                    //                 cubit.isCycleIdChange = true;
                    //               } else {
                    //                 cubit.isCycleIdChange = false;
                    //               }
                    //               navigateTo(context, STU_About_course());
                    //             },
                    //             child: rol == 'Student'
                    //                 ? Build_STU_Lec(
                    //                     courses: cubit.allLECFromHIVE[index],
                    //                   )
                    //                 : INS_Course(
                    //                     courses: insCourses[index],
                    //                   ));
                    //       },
                    //       separatorBuilder: (context, index) => const SizedBox(
                    //         height: 20,
                    //       ),
                    //       itemCount: rol == 'Student'
                    //           ? cubit.allLECFromHIVE.length
                    //           : insCourses.length,
                    //     ),
                    //   ),
                    // ),
                
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
