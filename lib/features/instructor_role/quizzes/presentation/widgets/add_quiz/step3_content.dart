import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/add_quiz/result_card.dart';



class Step3Content extends StatelessWidget {
  const Step3Content({
    super.key,
    required this.quizNameController,
    required this.quizGradeController,
    required this.quizDescriptionController,
    required this.endDate,
    required this.startDate,
  });

  final TextEditingController quizNameController;
  final TextEditingController quizDescriptionController;
  final TextEditingController quizGradeController;
  final String? endDate;
  final String? startDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResultCard(
            quizNameController: quizNameController,
            quizGradeController: quizGradeController,
            endDate: DateTime.parse(endDate!),
            startDate: DateTime.parse(startDate!),
          ),
        ],
      ),
    );
  }
}
