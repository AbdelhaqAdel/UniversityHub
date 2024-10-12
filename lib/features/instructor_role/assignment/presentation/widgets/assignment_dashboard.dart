import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../manager/assignment_cubit.dart';

class AssignmentInstructorDashboard extends StatelessWidget {
  const AssignmentInstructorDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignmentInstructorCubit, AssignmentInstructorState>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            radius: 1.1,
            center: Alignment.topRight,
            colors: [
              Colors.blue,
              Colors.indigo
            ],
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'You are a super warrior !',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 17),
                  ),
                  const SizedBox(height: 20),
                  _Done( text: 'Your have ${GetAssignmentInstructorSuccessState.pendingAssignmentInstructorEntity.length} pending tasks',),
                  const SizedBox(
                    height: 8,
                  ),
                  _Done( text: 'Your have ${GetAssignmentInstructorSuccessState.completedAssignmentInstructorEntity.length} Completed tasks',),
                ],
              ),
              const _Image(),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}


class _Done extends StatelessWidget {
  const _Done({
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(
            FontAwesomeIcons.check,
            size: 14,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Image(
        height: 120,
        width: 120,
        image: AssetImage('assets/images/R.png'),
      ),
    );
  }
}
