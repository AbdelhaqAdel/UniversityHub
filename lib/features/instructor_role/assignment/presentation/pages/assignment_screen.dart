import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/repositories/assignment_repo.dart';
import '../../domain/use_cases/add_assignment_usecase.dart';
import '../../domain/use_cases/delete_assignment_usecase.dart';
import '../../domain/use_cases/get_assignment_usecase.dart';
import '../../domain/use_cases/set_grade_assignment_usecase.dart';
import '../../domain/use_cases/update_assignment_usecase.dart';
import '../manager/assignment_cubit.dart';
import '../widgets/assignment_body.dart';

class AssignmentInstructorScreen extends StatelessWidget {
  const AssignmentInstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssignmentInstructorCubit(
          getAssignmentInstructorUseCase: GetAssignmentInstructorUseCase(
            assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
          ),
          updateAssignmentInstructorUseCase: UpdateAssignmentInstructorUseCase(
            assignmentRepo: getIt.get<AssignmentInstructorRepo>(),
          ),
          setGradeAssignmentUseCase: SetGradeAssignmentUseCase(assignmentRepo: getIt.get<AssignmentInstructorRepo>(),),
          addAssignmentUseCase: AddAssignmentUseCase(assignmentRepo: getIt.get<AssignmentInstructorRepo>(),),
          deleteAssignmentUseCase: DeleteAssignmentUseCase(assignmentRepo: getIt.get<AssignmentInstructorRepo>(),))..getAssignmentInstructor(),
      child: const AssignmentInstructorBody(),
    );
  }
}

