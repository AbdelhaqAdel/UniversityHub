import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import 'package:universityhup/features/student_role/assignment/data/repositories/assignment_repo_impl.dart';
import 'package:universityhup/features/student_role/assignment/domain/repositories/assignment_repo.dart';

import '../../../../../core/functions/setup_service_locator.dart';
import '../../data/data_sources/assignment_remote_data_source.dart';
import '../../domain/entities/assignment_entity.dart';
import '../../domain/use_cases/get_assignment_info_usecase.dart';
import '../../domain/use_cases/get_assignment_usecase.dart';
import '../../domain/use_cases/submit_assignment_usecase.dart';
import '../manager/assignment_cubit.dart';
import '../widgets/assignment_body.dart';

final List<AssignmentEntity> assignmentEntity = [];

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AssignmentCubit(
              getAssignmentUseCase: GetAssignmentUseCase(
                assignmentRepo: getIt.get<AssignmentRepo>(),
              ),
              getAssignmentInfoUseCase: GetAssignmentInfoUseCase(
                assignmentRepo: getIt.get<AssignmentRepo>(),
              ),
              submitAssignmentUseCase: SubmitAssignmentUseCase(
                assignmentRepo: getIt.get<AssignmentRepo>(),
              ))..getAssignmentUseCase,
      child: BlocConsumer<AssignmentCubit, AssignmentState>(
        listener: (context, state) {
          if(state is GetAssignmentSuccessState){
            showSnackBar(context: context, message: 'GetAssignmentSuccessState');
          }
        },
        builder: (context, state) {
          return const AssignmentBody();
        },
      ),
    );
  }
}
