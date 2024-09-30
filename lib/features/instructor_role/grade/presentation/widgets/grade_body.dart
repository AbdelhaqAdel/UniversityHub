import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/manager/grade_state.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/all%20students%20widgets/all_students_builder.dart';
import '../../../../../core/widgets/app_bar.dart';

class GradeBody extends StatelessWidget {
  const GradeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            DefaultAppBar(context: context), // No padding around this widget
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w), // Add padding to all other widgets
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FaIcon(FontAwesomeIcons.solidUser, color: Colors.teal),
                        const SizedBox(width: 15),
                        Text(
                          'Student name',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Colors.teal,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                        const Spacer(),
                        Text(
                          '${GetStudentForCourseSuccessState.allStudents.length}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ],
                    ),
                       const SizedBox(height: 15),
                    Container(
                      height: 2,
                      color: Colors.teal,
                      width: double.infinity,
                    ),
                      const SizedBox(height: 15),

                    const Expanded(child: AllStudentsBuilder()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
