

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/instructor_role/grade/domain/repositories/grade_repo.dart';
import 'package:universityhup/features/instructor_role/grade/domain/use_cases/get_grade_usecase.dart';
import 'package:universityhup/features/instructor_role/grade/domain/use_cases/get_students_for_course_use_case.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/manager/grade_cubit.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/manager/grade_state.dart';

class GradeShowDialogFun {
  static Future<void> call({
    required BuildContext context,
    required Widget dialogWidget,
    required String studentId
  }) async {
     showDialog<String>(
              context: context,
              barrierColor: Colors.black.withOpacity(.3),
              useSafeArea: true,
              builder: (BuildContext context) => BlocProvider(
                create: (context) => InsGradeCubit(
                       getGradeUseCase: InsGetGradeUseCase(
                gradeRepo: getIt.get<InsGradeRepo>(),
              ), getStudentsForCourseUseCase:GetStudentsForCourseUseCase(gradeRepo: getIt.get<InsGradeRepo>()),
                       )..getGrade(studentId: studentId),
                child:   BlocConsumer<InsGradeCubit,InsGradeState>(
                     listener: (context, state) {},
                     builder: (context, state) {
                       return AlertDialog(
                  insetPadding: const EdgeInsets.all(0.0),
                  scrollable: false,
                  shadowColor: Colors.transparent,
                  content: Center(
                    child:dialogWidget
                      ),
                  elevation: 0,
                  clipBehavior: Clip.none,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                );
           })),
            );
  }}