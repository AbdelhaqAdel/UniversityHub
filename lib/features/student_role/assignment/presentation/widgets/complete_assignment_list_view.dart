import 'package:flutter/material.dart';

import '../pages/assignment_screen.dart';
import 'complete_assignment.dart';

class CompleteAssignmentListView extends StatelessWidget {
  const CompleteAssignmentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height:500,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder:(context,index)=>InkWell(
              onTap: (){
                // navigateTo(context,STU_Assign_Screen() );
              },
              child: CompleteAssignment(assignmentEntity: assignmentEntity[index])),
          separatorBuilder: (context,index)=>const SizedBox(height: 10,),
          itemCount: 1,
        ),
      ),
    );
  }
}
