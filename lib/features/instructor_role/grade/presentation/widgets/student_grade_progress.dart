import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';

class StudentGradeProgress extends StatelessWidget {
  const StudentGradeProgress({super.key,required this.student, required this.totalGrade,});
  final StudentEntity student ;
  final double totalGrade;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: GlassBox(
          widget:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.solidUser,color: Colors.black,),
                    const SizedBox(width: 15,),
                    SizedBox(
                      width: 140,
                        child: Text(
                          student.studentName,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    const Spacer(),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${totalGrade.toInt()}/',
                          style: const TextStyle(
                            color: Colors.teal,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          '100',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: LinearPercentIndicator(
                    percent: totalGrade/100,
                    backgroundColor: Colors.blueGrey.withOpacity(.2),
                    progressColor: Colors.teal.withOpacity(.6),
                    barRadius: const Radius.circular(20),
                    lineHeight: 12,
                    trailing: const Text('100'),
                    leading: Text('${totalGrade.toInt()}'),

                    animation: true,
                    animationDuration: 1500,
                    curve: Curves.easeOutBack,                                   
                  ),
                ),
              ],
            ),
          ),
          color: Colors.blueGrey.withOpacity(.15),
          borderRadius: 20,
          x: 0,
          y: 0, border: false,),
    );

  }
}