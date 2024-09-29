import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/utils/app_router.dart';
import '../manager/assignment_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentInstructorCubit, AssignmentInstructorState>(
      listener: (context, state) {
        if (state is GetAssignmentInstructorSuccessState) {
          showSnackBar(
              context: context, message: 'GetAssignmentInstructorSuccessState');
        }
      },
      builder: (context, state) {
        if (GetAssignmentInstructorSuccessState
            .completedAssignmentInstructorEntity.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Map<String, dynamic> extraData = {
                      'taskId': GetAssignmentInstructorSuccessState
                          .completedAssignmentInstructorEntity[index].taskId!,
                      'cubit':
                          BlocProvider.of<AssignmentInstructorCubit>(context),
                    };
                    GoRouter.of(context).push(
                      AppRouter.kTaskResultScreen,
                      extra: extraData,
                    );
                    AssignmentInstructorCubit.get(context)
                        .getStudentSubmitAssignment(
                      assignmentId: GetAssignmentInstructorSuccessState
                          .completedAssignmentInstructorEntity[index].taskId!,
                    );
                  },
                  child: CompleteAssignmentInstructor(
                    assignmentEntity: GetAssignmentInstructorSuccessState
                        .completedAssignmentInstructorEntity[index],
                    startDate: DateTime.parse(
                        GetAssignmentInstructorSuccessState
                            .completedAssignmentInstructorEntity[index]
                            .startDate!),
                    endDate: DateTime.parse(
                        GetAssignmentInstructorSuccessState
                            .completedAssignmentInstructorEntity[index]
                            .endDate!),
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: GetAssignmentInstructorSuccessState
                  .completedAssignmentInstructorEntity.length,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
