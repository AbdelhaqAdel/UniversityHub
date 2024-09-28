import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/delete%20folder%20widgets/delete_button.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/edit%20folder%20widgets/edit_button.dart';

class FolderButtons extends StatelessWidget {
  const FolderButtons({super.key,required this.insFolder});
  final FolderEntity insFolder;
  @override
  Widget build(BuildContext context) {
      TextEditingController folderController=TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child:     Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
               EditButton(folderController: folderController, text: insFolder.lectureName!,onTap: (){},),
               const SizedBox(width: 10,),
               DeleteButton(folderController: folderController, text: insFolder.lectureName!,),
                ],
              ),
      ),
    );

  }
}
