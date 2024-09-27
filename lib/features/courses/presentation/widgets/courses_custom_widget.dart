import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/utils/assets.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';

class CoursesWidget extends StatelessWidget {
  const CoursesWidget({
    required this.courses,
    super.key});
  final CoursesModel courses;
  @override
  Widget build(BuildContext context) {
     var screenSize=MediaQuery.of(context).size;
    return  Container(
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black,
              width: .5,
            )),
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: KColors.subTitleColor.withOpacity(.8),
                image: const DecorationImage(
                  image: AssetImage(AssetsData.courseItemImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
             SizedBox(
              width: screenSize.width/20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courses.name,
                    maxLines: 1,
                   style:Theme.of(context).textTheme.bodyLarge,
                   overflow: TextOverflow.ellipsis,
                  ),
                 role=='Student'? Text(
                    '${courses.instructorFullName} ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:Theme.of(context).textTheme.bodySmall
                  ):Text(
                    '${courses.hours} Hours',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:Theme.of(context).textTheme.bodySmall
                  )
                ],
              ),
            ),
             SizedBox(
              width: screenSize.width/15,
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              child: FaIcon(
                FontAwesomeIcons.circleRight,
                color: KColors.tealColor.withOpacity(.8),
                size: 35.r,
              ),
            ),
          ],
        ),
      );
  }
}