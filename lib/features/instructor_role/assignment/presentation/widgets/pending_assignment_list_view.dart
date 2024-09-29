import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../manager/assignment_cubit.dart';

class PendingAssignmentInstructorListView extends StatefulWidget {
  const PendingAssignmentInstructorListView({
    super.key,
  });

  @override
  State<PendingAssignmentInstructorListView> createState() =>
      _PendingAssignmentInstructorListViewState();
}

class _PendingAssignmentInstructorListViewState extends State<PendingAssignmentInstructorListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentInstructorCubit, AssignmentInstructorState>(
      listener: (context, state) {
        if (state is GetAssignmentInstructorSuccessState) {
          showSnackBar(context: context, message: 'GetAssignmentInstructorSuccessState');
        }
      },
      builder: (context, state) {
        if (GetAssignmentInstructorSuccessState.pendingAssignmentInstructorEntity.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => PendingAssignmentInstructor(
                assignmentEntity: GetAssignmentInstructorSuccessState
                    .pendingAssignmentInstructorEntity[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount:
                  GetAssignmentInstructorSuccessState.pendingAssignmentInstructorEntity.length,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
