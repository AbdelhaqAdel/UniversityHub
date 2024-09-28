import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/utils/app_router.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';

import 'material_widget.dart';

class MaterialGridView extends StatelessWidget {
  const MaterialGridView({super.key,
  required this.materials,
  required this.context1,
  });
  final List<FolderEntity> materials;
  final BuildContext context1;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
           gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2, childAspectRatio: 2.5),
           itemBuilder: (context, index) => InkWell(
               onTap: () {
             AppRouter.context1=context1;
                GoRouter.of(context1).push(AppRouter.kMaterialFile,extra:materials[index].lectureId,);
               },
               child: MaterialWidget(
                   index: index,
                    material: materials[index], 
               )),
           scrollDirection: Axis.vertical,
           itemCount: materials.length, 
         );
  }
}