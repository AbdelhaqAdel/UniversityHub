import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/custom_text_form_field.dart';

class EditFolderForm extends StatelessWidget {
  const EditFolderForm({super.key,required this.folderController,required this.text});  
   final TextEditingController folderController ;
   final String text;
  @override
  Widget build(BuildContext context) {
     var screenSize=MediaQuery.of(context).size;  
    return  Column(
      children: [
          Row(
           children: [
             const FaIcon(FontAwesomeIcons.folder,size: 30,),
             const SizedBox(width: 15,),
             SizedBox(
              width: screenSize.width/1.5,
               child: Text(
                 'Edit $text name :',
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
                 style:Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900, fontSize: 20.sp,color: Colors.black),
               ),
             ),
           ],
         ),
         
          SizedBox(height: screenSize.height/30,),
             CustomTextFormField(
              withBorder: false,
              height: screenSize.height/14,
              prefixIcon:FontAwesomeIcons.pen,
               controller:folderController,
               keyboardType:TextInputType.text,
               hintText:'Enter new name',
                cursorColor: KColors.c1Color,
                obscureText: false, 
               suffix: const SizedBox(),
               borderRadius: 15,
             ),
      ],
    );
  }
}