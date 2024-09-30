import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/grade/domain/use_cases/get_students_for_course_use_case.dart';
import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/repositories/grade_repo.dart';
import '../../domain/use_cases/get_grade_usecase.dart';
import '../manager/grade_cubit.dart';
import '../widgets/grade_body.dart';


class InsGradeScreen extends StatelessWidget {
  const InsGradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InsGradeCubit(
              getGradeUseCase: InsGetGradeUseCase(
                gradeRepo: getIt.get<InsGradeRepo>(),
              ), getStudentsForCourseUseCase:GetStudentsForCourseUseCase(gradeRepo: getIt.get<InsGradeRepo>()),
            )..getStudentsForCourse(),
      child: const GradeBody(),
    );
  }
}
