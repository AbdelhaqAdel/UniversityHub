import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:universityhup/features/student_role/assignment/presentation/widgets/pending_assignment_list_view.dart';

import '../../../../../core/functions/app_bar.dart';
import 'assignment_dashboard.dart';
import 'complete_assignment_list_view.dart';
import 'custom_tab_bar.dart';

class AssignmentBody extends StatefulWidget {
  const AssignmentBody({
    super.key,
  });

  @override
  State<AssignmentBody> createState() => _AssignmentBodyState();
}

class _AssignmentBodyState extends State<AssignmentBody>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      initialIndex: tabController.index,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              DefaultAppBar(text: "cubit.currentCourseName", context: context),
              const SizedBox(
                height: 30,
              ),
              const AssignmentDashboard(),
               CustomTabBar(tabController: tabController,),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PendingAssignmentListView(),
                    CompleteAssignmentListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
