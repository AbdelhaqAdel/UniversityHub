import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/assignment_cubit.dart';
import '../widgets/assignment_body.dart';

class AddAssignmentScreen extends StatelessWidget {
  const AddAssignmentScreen({super.key, required this.cubit});
  final AssignmentInstructorCubit cubit; // Receive the cubit from the first screen

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: const AssignmentInstructorBody(),
    );
  }
}
