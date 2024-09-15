import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/features/student/material/presentation/widgets/file%20widgets/file_custom_widget.dart';

class FileGridView extends StatelessWidget {
  const FileGridView({super.key,
  // required this.material
  required this.context1,
  });
  // final FileEntity file;
  final BuildContext context1;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
              gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.h,
                childAspectRatio: .99,
              ),
              itemCount: 8,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
             onTap: (){},
             child: const FileWidget(
              // file: file,
              // courseMaterial: null,
             ),
           ),
         );
  }
}