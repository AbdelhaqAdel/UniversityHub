import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/AllCourses/data/repositories/courses_repo_impl.dart';
import 'package:universityhup/features/AllCourses/presentation/manager/cubit/courses_cubit.dart';
import 'package:universityhup/features/AllCourses/presentation/widgets/courses_builder.dart';
import 'package:universityhup/features/AllCourses/presentation/widgets/courses_title_custom_widget.dart';

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
                      height:screenSize.height/35 ,
                    ),     
                    const CoursesTitleCustomWidget(),           
                    const SizedBox(
                      height: 15,
                    ),
                    const Expanded(child: CoursesBuilder()),
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
