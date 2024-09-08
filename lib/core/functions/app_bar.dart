import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/courses/presentation/manager/cubit/courses_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    this.text,
    required this.context,
    super.key});
   final String? text;
    final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Stack(
  alignment: FractionalOffset.center,
  children: [
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: GestureDetector(
              onTap:(){
                Navigator.pop(context);
              },
              child: const FaIcon(FontAwesomeIcons.angleLeft,size: 30)),
        ),
      ],
    ),
    Text(
         text??GetAllCoursesSuccessState.currentCourseName,overflow: TextOverflow.ellipsis,maxLines: 1,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium
        ),
      
    

  ],
);}
}
