import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/delete%20folder%20widgets/delete_button.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/edit%20folder%20widgets/edit_button.dart';

class FileButtons extends StatelessWidget {
  const FileButtons({super.key,required this.fileEntity});
  final FileEntity fileEntity;
  @override
  Widget build(BuildContext context) {
            GlobalKey<FormState> folderFormKey=GlobalKey();

      TextEditingController folderController=TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child:     Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
               EditButton(folderController: folderController,
                folderFormKey:folderFormKey ,
                text: fileEntity.fileName,onTap: (){
                // InsMaterialCubit.get(context).updateFileName(folderId: fileEntity.lectureFileId,
                //  newFolderName: folderController.text, url: url)
               },),
               const SizedBox(width: 10,),
               DeleteButton(folderController: folderController, text: fileEntity.fileName,),
                ],
              ),
      ),
    );

  }
}
