import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/task_uploaded/student_listview.dart';
import '../../../../../../core/constants/constant.dart';
import '../../../../../../core/widgets/app_bar.dart';

class TaskResultBody extends StatelessWidget {
  const TaskResultBody({super.key, required this.taskId});
  final String taskId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            DefaultAppBar(text: currentCycleName, context: context),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: Colors.teal,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Student name',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.teal,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 2,
                      color: Colors.teal,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TaskResultListView(
                      taskId: taskId,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

