import 'package:flutter/material.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/file%20widgets/file_buttons.dart';


class FileWidget extends StatelessWidget {
  const FileWidget({super.key,
  required this.file,
   });
  final FileEntity file;
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.blueGrey.withOpacity(.15),
    ),
    padding: const EdgeInsets.all(6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          height: screenSize.height/10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: KColors.subTitleColor.withOpacity(.7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
              file.filePath.split('.').last,
              style:Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white), 
            ),
          ),
        
        const SizedBox(
          height: 8,
        ),
        FileButtons(fileEntity: file,),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                 file.fileName,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines:1,
                ),
                Text(
              '${file.createdAt.split('T').first} at ${file.createdAt.split('T').last}',
                  style:Theme.of(context).textTheme.labelSmall,)
              ],
            ),
          ),
        ),
   
   ])
    );
  
  }
}


