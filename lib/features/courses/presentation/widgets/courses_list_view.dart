import 'package:flutter/material.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';
import 'package:universityhup/features/courses/presentation/widgets/cousres_custom_widget.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({
    required this.courses,
    super.key});
  final List<CoursesModel>courses;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount:courses.length,
      itemBuilder:(context,index)=> CoursesWidget(courses:courses[index]),
      separatorBuilder: (context,index)=>const SizedBox(height: 10,),
    );
  }
}