import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/custom_text_form_field.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';

class AddEventForm extends StatelessWidget {
  const AddEventForm({super.key,required this.eventBodyController});  
   final TextEditingController eventBodyController ;

  @override
  Widget build(BuildContext context) {
     var screenSize=MediaQuery.of(context).size;  
    return  Column(
      children: [
          Row(
           children: [
             const FaIcon(FontAwesomeIcons.calendar,size: 30,),
             const SizedBox(width: 15,),
             Text(
               'Add event for this date\n${DateFormat("yyyy-MM-dd").format(ChangeCalenderDayState.thisFocusDay)}',
               maxLines: 2,
               overflow: TextOverflow.ellipsis,
               style:Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18.sp,color: Colors.black),
             ),
           ],
         ),
         const SizedBox(height: 15,),
             CustomTextFormField(
              withBorder: false,
              height: screenSize.height/12,
              prefixIcon:FontAwesomeIcons.calendar,
               controller:eventBodyController,
               keyboardType:TextInputType.text,
               hintText:'Enter event title',
                cursorColor: KColors.c1Color,
                obscureText: false, 
               suffix: const SizedBox(),
               borderRadius: 15,
             ),
      ],
    );
  }
}