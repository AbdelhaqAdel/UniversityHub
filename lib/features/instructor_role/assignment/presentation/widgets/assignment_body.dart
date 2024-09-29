import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/pending_assignment_list_view.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/widgets/app_bar.dart';
import 'assignment_dashboard.dart';
import 'complete_assignment_list_view.dart';
import 'custom_tab_bar.dart';

class AssignmentInstructorBody extends StatefulWidget {
  const AssignmentInstructorBody({
    super.key,
  });

  @override
  State<AssignmentInstructorBody> createState() => _AssignmentInstructorBodyState();
}

class _AssignmentInstructorBodyState extends State<AssignmentInstructorBody>
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
              DefaultAppBar(text: currentCycleName, context: context),
              const SizedBox(
                height: 30,
              ),
              const AssignmentInstructorDashboard(),
               CustomTabBar(tabController: tabController,),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PendingAssignmentInstructorListView(),
                    CompleteAssignmentInstructorListView(),
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
