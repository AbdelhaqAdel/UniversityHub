import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/pending_quiz_list_view.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/widgets/app_bar.dart';
import 'complete_quiz_list_view.dart';
import 'custom_tab_bar.dart';

class QuizInstructorBody extends StatefulWidget {
  const QuizInstructorBody({
    super.key,
  });

  @override
  State<QuizInstructorBody> createState() => _QuizInstructorBodyState();
}

class _QuizInstructorBodyState extends State<QuizInstructorBody>
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
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            DefaultAppBar(text: currentCycleName, context: context),
            const SizedBox(
              height: 30,
            ),
            CustomTabBar(tabController: tabController,),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  PendingQuizInstructorListView(),
                  CompleteQuizInstructorListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
