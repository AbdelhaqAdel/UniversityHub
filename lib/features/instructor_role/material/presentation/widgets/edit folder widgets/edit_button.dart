import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/edit%20folder%20widgets/edit_glass_box_custom.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/show_dialog_fun.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key,required this.folderController,required this.text,required this.onTap,
  required this.folderFormKey,
  });
 final TextEditingController folderController;
 final String text;
  final Function onTap;
  final GlobalKey<FormState> folderFormKey;

  @override
  Widget build(BuildContext context) {
    return    InkWell(
                    onTap: () {
                      ShowDialogFun.call(context: context,
                       dialogWidget: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:GlassBoxCustom(text: text, folderController: folderController, folderFormKey: folderFormKey,
                        onTap: onTap,
                        )
                      ),
                    ),
           );
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: .5,
                          color: Colors.blue.withOpacity(1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.pen,
                          size: 13,
                          color: Colors.blue.withOpacity(1),
                        ),
                      ),
                    ),
                
                  );
  }
}

