import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({
    required this.material,
    required this.index,
    super.key});
      final FolderEntity material;
      final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: .5),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
             FaIcon(
              FontAwesomeIcons.solidFolderClosed,
              color: KColors.subTitleColor,
              size: 30.sp,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                maxLines: 2,
                // 'material name',
               '${material.lectureName}',
               overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: KColors.c1Color),
              ),
            ),
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.02,
            ),
               
          ],
        ),
      ),
    );
  }
}

