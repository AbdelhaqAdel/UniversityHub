import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizData extends StatelessWidget {
  const QuizData({
    required this.icon,
    required this.text,
    super.key});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Row(
             children: [
                FaIcon(
                 icon,
                 size: 12,
               ),
               SizedBox(
                 width: 7.w,
               ),
               Expanded(
                 child: Text(
                   text,
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                   textAlign: TextAlign.start,
                   style: Theme.of(context).textTheme.bodyMedium,
                 ),
               ),
             ],
           ),
           const SizedBox(
             height: 2,
           ),
      ],
    );
  }
}