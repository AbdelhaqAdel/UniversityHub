import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/add%20material%20widgets/add_material_form.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/show_dialog_fun.dart';

class CustomFloatingAction extends StatelessWidget {
  const CustomFloatingAction({
    super.key, required this.type,
    required this.onTap, required this.materialController,
    required this.formKey ,
  });
  final TextEditingController materialController;
  final String type;
  final Function onTap;
  final GlobalKey<FormState> formKey ;

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding:
          const EdgeInsets.symmetric( horizontal: 8),
      child: FloatingActionButton(
          backgroundColor: KColors.buttonColor,
          onPressed: () {
            ShowDialogFun.call(context: context,
             dialogWidget: 
                 SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: GlassBox(
                            border: false,
                            widget: Column(
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
                   key: formKey,
                   child: Column(
                     children: [
                       const Spacer(),
                       AddMaterialForm(
                         eventBodyController:
                             materialController, type: type,
                       ),
                       SizedBox(
                         height: screenSize.height *
                             0.02,
                       ),
                     CustomButton(
                               onTap: () {
                                 onTap();
                               },
                               height: screenSize.height /17,
                               color: KColors.buttonColor,
                               fontSize: 20.sp,
                               text: 'Add')
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
                            color: Colors.transparent,
                            borderRadius: 0,
                            x: 3,
                            y: 3),
                      ),
                    ),
                );
          },
          child: const FaIcon(
            FontAwesomeIcons.plus,
            color: KColors.secondaryColor,
          )),
    );
  }
}

