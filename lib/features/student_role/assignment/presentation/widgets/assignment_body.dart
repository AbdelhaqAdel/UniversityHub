import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:universityhup/features/student_role/assignment/presentation/widgets/pending_assignment_list_view.dart';

import '../../../../../core/functions/app_bar.dart';
import 'assignment_dashboard.dart';
import 'complete_assignment_list_view.dart';
import 'custom_tab_bar.dart';

class AssignmentBody extends StatelessWidget {
  const AssignmentBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              DefaultAppBar(
                  text: "cubit.currentCourseName",
                  context:context),
              const SizedBox(height: 30,),
              const AssignmentDashboard(),
              const CustomTabBar(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ConditionalBuilder(condition: assignmentTabIndex==0,
                  builder: (context) =>const PendingAssignmentListView() ,
                  fallback: (context) => const CompleteAssignmentListView(),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}




