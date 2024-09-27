import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student_role/assignment/presentation/widgets/pending_assignment.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../manager/assignment_cubit.dart';

class PendingAssignmentListView extends StatefulWidget {
  const PendingAssignmentListView({
    super.key,
  });

  @override
  State<PendingAssignmentListView> createState() =>
      _PendingAssignmentListViewState();
}

class _PendingAssignmentListViewState extends State<PendingAssignmentListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentCubit, AssignmentState>(
      listener: (context, state) {
        if (state is GetAssignmentSuccessState) {
          showSnackBar(context: context, message: 'GetAssignmentSuccessState');
        }
      },
      builder: (context, state) {
        if (GetAssignmentSuccessState.pendingAssignmentEntity.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => PendingAssignment(
                assignmentEntity: GetAssignmentSuccessState
                    .pendingAssignmentEntity[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount:
                  GetAssignmentSuccessState.pendingAssignmentEntity.length,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
