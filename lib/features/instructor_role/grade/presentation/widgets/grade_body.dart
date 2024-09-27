import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_bar.dart';
import 'grade_table.dart';

class GradeBody extends StatelessWidget {
  const GradeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              DefaultAppBar(
                  text: "currentCourseName",
                  context:context),
              const SizedBox(height: 30,),
              const GradeTable(),
            ],
          ),
        ),

      ),
    );
  }
}




