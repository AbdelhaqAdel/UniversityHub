import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/delete%20folder%20widgets/delete_glass_box_custom.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/show_dialog_fun.dart';

class DeleteButton<EntityType> extends StatelessWidget {
  const DeleteButton({super.key,required this.folderController,required this.text, required this.onTapYes,});
 final TextEditingController folderController;
 final String text;
 final Function onTapYes;

  @override
  Widget build(BuildContext context) {
      TextEditingController folderController=TextEditingController();
    return    InkWell(
                    onTap: () {
                      folderController.text = '';
                       ShowDialogFun.call(context: context,
                        dialogWidget: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:DeleteGlassBoxCustom(text: text,onTapYes: onTapYes,)
                      ),
                    ),);
                       },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: .5,
                          color: Colors.red.withOpacity(1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.trash,
                          size: 13,
                          color: Colors.red.withOpacity(1),
                        ),
                      ),
                    ),
                
                  );
  }
}


