import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/utils/app_router.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';
import 'package:universityhup/features/courses/presentation/widgets/courses_custom_widget.dart';

import '../../../../core/constants/constant.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({required this.courses, super.key});
  final List<CoursesModel> courses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8,bottom: 70),
      child: ListView.separated(
        itemCount: courses.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              currentCycleId=courses[index].cycleId;
              currentCycleName=courses[index].name;
              GoRouter.of(context).push(AppRouter.kAboutCourse);
            },
            child: CoursesWidget(courses: courses[index])),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
