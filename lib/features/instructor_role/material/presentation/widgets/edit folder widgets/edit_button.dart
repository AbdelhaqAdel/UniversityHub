import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_files_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_usecase.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/edit%20folder%20widgets/edit_glass_box_custom.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key,required this.folderController,required this.text,required this.onTap});
 final TextEditingController folderController;
 final String text;
  final Function onTap;


  @override
  Widget build(BuildContext context) {
          GlobalKey<FormState> folderFormKey=GlobalKey<FormState>();
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
                          materialUseCase: getIt<InsMaterialUseCase>(),fileUseCase: getIt<InsMaterialFilesUseCase>(),),
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
                        child:GlassBoxCustom(text: text, folderController: folderController, folderFormKey: folderFormKey,
                        onTap: onTap,
                        )
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
                          color: Colors.blue.withOpacity(1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.pen,
                          size: 13,
                          color: Colors.blue.withOpacity(1),
                        ),
                      ),
                    ),
                
                  );
  }
}