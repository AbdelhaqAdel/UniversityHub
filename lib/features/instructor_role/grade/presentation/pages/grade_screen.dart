import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/entities/grade_entity.dart';
import '../../domain/repositories/grade_repo.dart';
import '../../domain/use_cases/get_grade_usecase.dart';
import '../manager/grade_cubit.dart';
import '../widgets/grade_body.dart';


class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GradeCubit(
              getGradeUseCase: GetGradeUseCase(
                gradeRepo: getIt.get<GradeRepo>(),
              ),
            )..getGrade(),
      child: const GradeBody(),
    );
  }
}
