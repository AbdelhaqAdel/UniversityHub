import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/core/functions/open_file.dart';
import 'package:universityhup/core/functions/store_to_history.dart';
import 'package:universityhup/features/student_role/material/domain/entities/material_file_entity.dart';
import 'file_custom_widget.dart';

class FileGridView extends StatelessWidget {
  const FileGridView({super.key,
  required this.files,
  required this.context1,
  });
  final List<FileEntity> files;
  final BuildContext context1;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
              gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.h,
                childAspectRatio: .96,
              ),
              itemCount:files.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
             onTap: (){
              // MaterialCubit.get(context).openFile(filePath: files[index].filePath); 
               downloadNewFileOrOpen(files[index].filePath,context);
              StoryServices.stuStoreHistoryToHive(materialName: 'File name: ${files[index].fileName}', 
              historyMessage: 'New file downloaded');
             },
             child: FileWidget(
              file: files[index],
             ),
           ),
         );
  }
}