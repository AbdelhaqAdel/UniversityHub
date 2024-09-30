import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/grade_entity.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/all%20students%20widgets/student_widget.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/dialog_widget.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/show_dialog_fun.dart';

class AllStudentsListView extends StatelessWidget {
  const AllStudentsListView({super.key, required this.students,required this.cubitContext, required this.studentGrades, required this.totalGrade});
  final List<StudentEntity>students;
    final List<InsGradeEntity>studentGrades;
    final double totalGrade;

  final BuildContext cubitContext;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder:(context,index)=>
     InkWell(
      onTap: (){
        GradeShowDialogFun.call(context: cubitContext, dialogWidget: DialogWidget(
          student: students[index], 
        allGrades: studentGrades, totalGrade: totalGrade,),
         studentId: students[index].studentId);  
      },
      child: StudentWidget(allStudents: students[index], index: index,)),  
    separatorBuilder: (context,index)=>Container(
                      height: 0.5,
                      color: Colors.grey[300],
                      width: double.infinity,
                    ),
     itemCount: students.length);
  }
}