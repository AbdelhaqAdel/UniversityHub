import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/custom_text_form_field.dart';

class AddMaterialForm extends StatelessWidget {
  const AddMaterialForm({super.key,required this.eventBodyController, required this.type});  
   final TextEditingController eventBodyController ;
   final String type;
  @override
  Widget build(BuildContext context) {
     var screenSize=MediaQuery.of(context).size;  
    return  Column(
      children: [
          Row(
           children: [
             const FaIcon(FontAwesomeIcons.add,size: 25,),
             const SizedBox(width: 15,),
             Text(
               'Add New $type',
               maxLines: 2,
               overflow: TextOverflow.ellipsis,
               style:Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18.sp,color: Colors.black),
             ),
           ],
         ),
          SizedBox(height: MediaQuery.of(context).size.height/20,),
             CustomTextFormField(
              withBorder: false,
              height: screenSize.height/13,
              prefixIcon:FontAwesomeIcons.pen,
               controller:eventBodyController,
               keyboardType:TextInputType.text,
               hintText:'Enter $type title',
                cursorColor: KColors.c1Color,
                obscureText: false, 
               suffix: const SizedBox(),
               borderRadius: 15,
             ),
      ],
    );
  }
}