import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/add_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/delete_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_files_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/update_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';

class ShowDialogFun {
  static Future<void> call({
    required BuildContext context,
    required Widget dialogWidget,
  }) async {
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
                       return AlertDialog(
                  insetPadding: const EdgeInsets.all(0.0),
                  scrollable: false,
                  shadowColor: Colors.transparent,
                  content: Center(
                    child:dialogWidget
                      ),
                  elevation: 0,
                  clipBehavior: Clip.none,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                );
           })),
            );
  }}