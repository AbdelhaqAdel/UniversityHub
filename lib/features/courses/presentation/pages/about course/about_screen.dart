import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/utils/app_router.dart';
import 'package:universityhup/core/utils/assets.dart';
import 'package:universityhup/features/courses/presentation/widgets/about%20course/about_button_custom_widget.dart';

import '../../../../../core/constants/constant.dart';

class AboutCourseScreen extends StatelessWidget {
  const AboutCourseScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          DefaultAppBar(
            context: context,
            ),
          SizedBox(
            height: screenSize.height / 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: screenSize.height *.65,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        AboutButton(
                          text: 'Material',
                          color: Colors.greenAccent.withOpacity(.25),
                          image: AssetsData.courseMaterialImage, onTap: () {
                            GoRouter.of(context).push(AppRouter.kMaterialFolders); 
                           },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        AboutButton(
                          text: 'Assignment',
                          color: Colors.deepPurpleAccent.withOpacity(.25),
                          image: AssetsData.courseAssignImage,
                          onTap: () {
                            if(role=='Student'){
                              GoRouter.of(context).push(AppRouter.kAssignmentScreen);
                            }else{
                              GoRouter.of(context).push(AppRouter.kAssignmentInstructorScreen);
                            }

                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                          AboutButton(text: 'Quizzes',
                           color:Colors.pinkAccent.withOpacity(.18),
                           image: AssetsData.courseQuizImage,
                           onTap: (){
                            GoRouter.of(context).push(AppRouter.kQuizzes);
                           },
                           ),

                        const SizedBox(
                          width: 15,
                        ),
                        AboutButton(
                          text: 'Grades',
                          color: Colors.lightBlueAccent.withOpacity(.25),
                          image: AssetsData.courseGradesImage,
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kGrade);

                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}

