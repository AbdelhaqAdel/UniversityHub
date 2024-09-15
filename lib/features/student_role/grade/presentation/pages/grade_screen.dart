import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/entities/grade_entity.dart';
import '../../domain/repositories/grade_repo.dart';
import '../../domain/use_cases/get_grade_usecase.dart';
import '../manager/grade_cubit.dart';
import '../manager/grade_state.dart';
import '../widgets/grade_body.dart';

final List<GradeEntity> gradeEntity = [];

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
            )..getGradeUseCase,
      child: BlocConsumer<GradeCubit, GradeState>(
        listener: (context, state) {
          if(state is GetGradeSuccessState){
            showSnackBar(context: context, message: 'GetGradeSuccessState');
          }
        },
        builder: (context, state) {
          return const GradeBody();
        },
      ),
    );
  }
}
