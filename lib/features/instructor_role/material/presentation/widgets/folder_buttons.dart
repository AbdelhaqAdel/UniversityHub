import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/delete%20folder%20widgets/delete_button.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/edit%20folder%20widgets/edit_button.dart';

class FolderButtons extends StatelessWidget {
  const FolderButtons({super.key,required this.insFolder});
  final FolderEntity insFolder;
  @override
  Widget build(BuildContext context) {
      TextEditingController folderController=TextEditingController();
        GlobalKey<FormState> folderFormKey=GlobalKey();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child:     Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
               EditButton(folderController: folderController,
               folderFormKey: folderFormKey,
                text: insFolder.lectureName!,onTap: (){
                  if (folderFormKey
                        .currentState!.validate()) {
                       InsMaterialCubit.get(context).updateFolderName(folderId: insFolder.lectureId??'', newFolderName: folderController.text).then((v){
                      Navigator.pop(context);

                       });
                     } 
                     
                     },),
               const SizedBox(width: 10,),
               DeleteButton(folderController: folderController, text: 'name',),
                ],
              ),
      ),
    );

  }
}
