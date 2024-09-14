import 'package:flutter/material.dart';
import 'package:universityhup/features/student/material/presentation/widgets/material_widget.dart';

class MaterialGridView extends StatelessWidget {
  const MaterialGridView({super.key,
  // required this.material
  });
  // final FolderEntity material;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
           gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2, childAspectRatio: 2.5),
           itemBuilder: (context, index) => InkWell(
               onTap: () {
                //  cubit.getCourseFilesFromHIVE(lecId: cubit.stuHIVElecModel[index].lectureId!);
                //  cubit.isLec=true;
                //  navigateTo(context, STU_Show_Material_Lec_Or_Sec());
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