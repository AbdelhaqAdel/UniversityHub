import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/grade_entity.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/stu%20grade%20widgets/grade_builder.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/student_grade_progress.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key, required this.student, required this.allGrades, required this.totalGrade});
  final StudentEntity student;
  final List<InsGradeEntity> allGrades;
  final double totalGrade;

  @override
  Widget build(BuildContext context) {
    return GlassBox(
      border: false,
      widget: Stack(
        children: [
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GlassBox(
                  border: true,
                  widget: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SingleChildScrollView( 
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .7,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 25.0,
                              left: 10,
                              right: 10,
                              top: 20,
                            ),
                            child: ListView(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                DefaultAppBar(context: context),
                                const SizedBox(
                                  height: 30,
                                ),
                                StudentGradeProgress(student: student, totalGrade: totalGrade,),
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: AllStudentsBuilder(),
                                ),
                              ],
                            ),
                          ),),),),),
                  color: Colors.white.withOpacity(.5),
                  borderRadius: 20.sp,
                  x: 15,
                  y: 15,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ],
      ),
      color: Colors.transparent,
      borderRadius: 0,
      x: 3,
      y: 3,
    );
  }
}
