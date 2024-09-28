
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/utils/app_router.dart';


class CompleteAssignmentInstructorStates extends StatelessWidget {
  const CompleteAssignmentInstructorStates({
    super.key, required this.taskId,
  });
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // GoRouter.of(context).push(AppRouter.kTaskResult,extra: taskId);
            },
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(.6),
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(width: .5),
              ),
              child: const Center(
                child: Text(
                  'Result',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

