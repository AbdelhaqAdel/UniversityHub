import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/utils/app_router.dart';

import 'material_widget.dart';

class MaterialGridView extends StatelessWidget {
  const MaterialGridView({super.key,
  // required this.material
  required this.context1,
  });
  // final FolderEntity material;
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
                GoRouter.of(context1).push(AppRouter.kMaterialFile);
               },
               child: MaterialWidget(
                   index: index,
                    // material: material, 
               )),
           scrollDirection: Axis.vertical,
           itemCount: 8,
         );
  }
}