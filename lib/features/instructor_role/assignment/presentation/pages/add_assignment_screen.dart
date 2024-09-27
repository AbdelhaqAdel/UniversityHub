import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import 'package:universityhup/features/student_role/assignment/data/repositories/assignment_repo_impl.dart';
import 'package:universityhup/features/student_role/assignment/domain/repositories/assignment_repo.dart';

import '../../../../../core/functions/setup_service_locator.dart';
import '../../data/data_sources/assignment_remote_data_source.dart';
import '../../domain/entities/assignment_entity.dart';
import '../../domain/repositories/assignment_repo.dart';
import '../../domain/use_cases/get_assignment_info_usecase.dart';
import '../../domain/use_cases/get_assignment_usecase.dart';
import '../../domain/use_cases/submit_assignment_usecase.dart';
import '../manager/assignment_cubit.dart';
import '../widgets/assignment_body.dart';




class AddAssignmentScreen extends StatelessWidget {
  const AddAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AssignmentInstructorCubit(
          getAssignmentInstructorUseCase: GetAssignmentInstructorUseCase(
            assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
          ),
          getAssignmentInstructorInfoUseCase: GetAssignmentInstructorInfoUseCase(
            assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
          ),
          submitAssignmentInstructorUseCase: SubmitAssignmentInstructorUseCase(
            assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
          ))..getAssignmentInstructor(),
      child: const AssignmentInstructorBody(),
    );
  }
}

