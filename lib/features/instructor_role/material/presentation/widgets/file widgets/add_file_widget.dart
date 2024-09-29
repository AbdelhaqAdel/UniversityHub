import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/add_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/delete_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_files_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/update_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';

class FileCustomFloatingAction extends StatelessWidget {
  const FileCustomFloatingAction({
    super.key,
    required this.onTap,
    required this.formKey 
  });
  final Function onTap;
  final GlobalKey<FormState> formKey ;

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding:
          const EdgeInsets.symmetric( horizontal: 8),
      child: FloatingActionButton(
          backgroundColor: KColors.buttonColor,
          onPressed: () {
            showDialog<String>(
              context: context,
              barrierColor: Colors.black.withOpacity(.3),
              useSafeArea: true,
              builder: (BuildContext context) => BlocProvider(
                create: (context) => InsMaterialCubit(
                        materialUseCase: getIt<InsMaterialUseCase>(),fileUseCase: getIt<InsMaterialFilesUseCase>(), 
                        updateMaterialUseCase: getIt.get<UpdateMaterialUseCase>(),
                       deleteMaterialUseCase: getIt.get<DeleteMaterialUseCase>(),
                      addMaterialUseCase: getIt.get<AddMaterialUseCase>(),
                       ),
                child:   BlocConsumer<InsMaterialCubit,MaterialsState>(
                     listener: (context, state) {},
                     builder: (context, state) {
                      InsMaterialCubit.get(context).pickedFile=null;
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
                        child: GlassBox(
                            border: false,
                            widget: Stack(
                              children: [
                                Column(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GlassBox(
                                        border: true,
                                        widget: SizedBox(
                                          height: MediaQuery.of(context).size.height /3.5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Form(
                                              key: formKey,
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  CustomButton(
                                                          onTap: () {
                                                            
                                                            onTap();
                                                          },
                                                          height: screenSize.height /17,
                                                          color: KColors.buttonColor,
                                                          fontSize: 20.sp,
                                                          text:InsMaterialCubit.get(context).pickedFile==null? 'Upload File'
                                                          :'Done',)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        color: Colors.white.withOpacity(.5),
                                        borderRadius: 20.sp,
                                        x: 15,
                                        y: 15,
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            color: Colors.transparent,
                            borderRadius: 0,
                            x: 3,
                            y: 3),
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
          child: const FaIcon(
            FontAwesomeIcons.plus,
            color: KColors.secondaryColor,
          )),
    );
  }
}
