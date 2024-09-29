import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/delete_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_files_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/update_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/delete%20folder%20widgets/delete_glass_box_custom.dart';

class DeleteButton<EntityType> extends StatelessWidget {
  const DeleteButton({super.key,required this.folderController,required this.text, required this.onTapYes,});
 final TextEditingController folderController;
 final String text;
 final Function onTapYes;

  @override
  Widget build(BuildContext context) {
      TextEditingController folderController=TextEditingController();
    return    InkWell(
                    onTap: () {
                      folderController.text = '';
                    showDialog<String>(
              context: context,
              barrierColor: Colors.black.withOpacity(.3),
              useSafeArea: true,
              builder: (BuildContext context) => BlocProvider(
                create: (context) => InsMaterialCubit(
                          materialUseCase: getIt<InsMaterialUseCase>(),fileUseCase: getIt<InsMaterialFilesUseCase>(),
                               updateMaterialUseCase: getIt.get<UpdateMaterialUseCase>(), 
                               deleteMaterialUseCase:getIt.get<DeleteMaterialUseCase>() ,
                          ),
                child:   BlocConsumer<InsMaterialCubit,MaterialsState>(
                     listener: (context, state) {},
                     builder: (context, state) {
                       return AlertDialog(
                  insetPadding: const EdgeInsets.all(0.0),
                  scrollable: false,
                  shadowColor: Colors.transparent,
                  content: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:DeleteGlassBoxCustom(text: text,onTapYes: onTapYes,)
                      ),
                    ),
                  ),
                  elevation: 0,
                  clipBehavior: Clip.none,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                );
           })),
            );
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: .5,
                          color: Colors.red.withOpacity(1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.trash,
                          size: 13,
                          color: Colors.red.withOpacity(1),
                        ),
                      ),
                    ),
                
                  );
  }
}