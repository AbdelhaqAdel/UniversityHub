import 'package:flutter/material.dart';

import 'activity.dart';
import 'dashboard_news.dart';
import 'dashboard_task_quiz.dart';
import 'great.dart';
import 'hi_user.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HiUser(),
          DashboardNews(),
          const SizedBox(
            height: 10,
          ),
          const Activity(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                DashboardTaskQuiz(),


                const SizedBox(
                  width: 10,
                ),

                const Great(),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
