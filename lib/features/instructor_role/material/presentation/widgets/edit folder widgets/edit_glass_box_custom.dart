import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/edit%20folder%20widgets/folder_form.dart';

class GlassBoxCustom extends StatelessWidget {
  const GlassBoxCustom({super.key,required this.text,required this.folderController,required this.folderFormKey,required this.onTap}); 
 final String text;
 final GlobalKey<FormState> folderFormKey; 
 final TextEditingController folderController;
 final Function onTap;
  @override
  Widget build(BuildContext context) {
   var screenSize = MediaQuery.sizeOf(context);

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
                      widget: SizedBox(
                        height: MediaQuery.of(context).size.height /3.5,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Form(
                            key: folderFormKey,
                            child: Column(
                              children: [
                                const Spacer(),
                                EditFolderForm(
                                  folderController:
                                      folderController, text: text,
                                ),
                                 SizedBox(
                                  height: screenSize.height *
                                      0.02,
                                ),
                              CustomButton(
                                        onTap: () {
                                          if (folderFormKey
                                              .currentState!
                                              .validate()) {
                                            onTap();}
                                        },
                                        height: screenSize.height /17,
                                        color: KColors.buttonColor,
                                        fontSize: 20.sp,
                                        text: 'Done')
                              ],
                            ),
                          ),
                        ),
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
          ),
          color: Colors.transparent,
          borderRadius: 0,
          x: 3,
          y: 3);
  }
}