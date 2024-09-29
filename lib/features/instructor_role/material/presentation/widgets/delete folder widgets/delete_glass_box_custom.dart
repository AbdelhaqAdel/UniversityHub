import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/core/widgets/custom_confirm_alert.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

class DeleteGlassBoxCustom extends StatelessWidget {
  const DeleteGlassBoxCustom({super.key,required this.text, required this.onTapYes}); 
 final String text;
 final Function onTapYes;

  @override
  Widget build(BuildContext context) {

    return  GlassBox(
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
                      widget:
                      
                      CustomConfirmAlert( context: context,
                            no: () {
                              Navigator.pop(context);
                            },
                            text:
                                'Do you want to delete $text ?',
                            yes: () {onTapYes();
                              // InsMaterialCubit.get(context).deleteFolder(
                              //     folderId: insFolder.lectureId);
                              // Navigator.pop(context);
                            },
                            ),
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
          ), color: Colors.transparent,
          borderRadius: 0,
          x: 3,
          y: 3,);
  }
}