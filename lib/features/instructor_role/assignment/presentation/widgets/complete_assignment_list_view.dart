import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../domain/entities/assignment_entity.dart';
import '../manager/assignment_cubit.dart';
import '../pages/assignment_screen.dart';
import 'complete_assignment.dart';

class CompleteAssignmentInstructorListView extends StatefulWidget {
  const CompleteAssignmentInstructorListView({
    super.key,
  });

  @override
  State<CompleteAssignmentInstructorListView> createState() =>
      _CompleteAssignmentInstructorListViewState();
}

class _CompleteAssignmentInstructorListViewState
    extends State<CompleteAssignmentInstructorListView> {
  static List<AssignmentInstructorEntity> completedAssignmentInstructorEntity = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentInstructorCubit, AssignmentInstructorState>(
      listener: (context, state) {
        if (state is GetAssignmentInstructorSuccessState) {
          showSnackBar(context: context, message: 'GetAssignmentInstructorSuccessState');
        }
      },
      builder: (context, state) {
        if (GetAssignmentInstructorSuccessState.completedAssignmentInstructorEntity.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: CompleteAssignmentInstructor(
                      assignmentEntity: GetAssignmentInstructorSuccessState
                          .completedAssignmentInstructorEntity[index])),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount:
                  GetAssignmentInstructorSuccessState.completedAssignmentInstructorEntity.length,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}