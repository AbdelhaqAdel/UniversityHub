import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../domain/entities/assignment_entity.dart';
import '../manager/assignment_cubit.dart';
import '../pages/assignment_screen.dart';
import 'complete_assignment.dart';

class CompleteAssignmentListView extends StatefulWidget {
  const CompleteAssignmentListView({
    super.key,
  });

  @override
  State<CompleteAssignmentListView> createState() =>
      _CompleteAssignmentListViewState();
}

class _CompleteAssignmentListViewState
    extends State<CompleteAssignmentListView> {
  static List<AssignmentEntity> completedAssignmentEntity = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentCubit, AssignmentState>(
      listener: (context, state) {
        if (state is GetAssignmentSuccessState) {
          showSnackBar(context: context, message: 'GetAssignmentSuccessState');
        }
      },
      builder: (context, state) {
        if (GetAssignmentSuccessState.completedAssignmentEntity.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: CompleteAssignment(
                      assignmentEntity: GetAssignmentSuccessState
                          .completedAssignmentEntity[index])),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount:
                  GetAssignmentSuccessState.completedAssignmentEntity.length,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
