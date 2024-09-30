import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';

class StudentWidget extends StatelessWidget {
  const StudentWidget({super.key, required this.index, required this.allStudents});
  final int index;  
  final StudentEntity allStudents;
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: EdgeInsets.symmetric(vertical: 10.0.w), // Add padding to all other widgets
      child: SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(
                        '${index+1}- ',
                        style: Theme.of(context).textTheme.bodyLarge, 
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        allStudents.studentName,
                          style: Theme.of(context).textTheme.bodyLarge, 
      
                        textAlign: TextAlign.center,
                         ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal,width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 6),
                      child: Text(
                        'more',
                         style: Theme.of(context).textTheme.titleSmall, 
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )),
    );
  }

  
}

