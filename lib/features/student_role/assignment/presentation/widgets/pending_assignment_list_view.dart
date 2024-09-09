import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:universityhup/features/student_role/assignment/presentation/widgets/pending_assignment.dart';

import '../pages/assignment_screen.dart';

class PendingAssignmentListView extends StatelessWidget {
  const PendingAssignmentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: 500,
        child: ConditionalBuilder(
          condition:true,
          builder:(context)=> ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder:(context,index)=>InkWell(
                onTap: (){
                  // cubit.assignName=assign[index].taskName;
                  // cubit.assignFile=null;
                  // cubit.taskId=assign[index].taskId;
                  // cubit.all_assign_files_List=[];
                  // cubit.StuGetAssignData();
                  // navigateTo(context,STU_About_Assign_Screen() );
                },
                child: PendingAssignment( assignmentEntity:assignmentEntity[index] , )),
            separatorBuilder: (context,index)=>const SizedBox(height: 10,),
            itemCount:assignmentEntity.length,
          ),
          fallback:(context)=> const Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}
