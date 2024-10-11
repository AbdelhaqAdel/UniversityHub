import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/assignment_cubit.dart';
import '../widgets/add_assignment/add_assignment_body.dart';

class AddAssignmentScreen extends StatelessWidget {
  const AddAssignmentScreen({super.key, required this.cubit});
  final AssignmentInstructorCubit
      cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: const Scaffold(
        body: AddAssignmentBody(),
      ),
    );
  }
}
