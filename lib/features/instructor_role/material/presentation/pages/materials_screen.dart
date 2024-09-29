import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/core/widgets/screen_path.dart';
import 'package:universityhup/core/widgets/tapbar_widget.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/add_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/delete_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/update_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/add%20material%20widgets/floating_action_button.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/labs_builder.dart';
import '../../domain/use_cases/material_files_usecase.dart';
import '../../domain/use_cases/material_usecase.dart';
import '../manager/cubit/material_cubit.dart';
import '../widgets/lec_builder.dart';

class InsMaterialScreen extends StatelessWidget {
  const InsMaterialScreen({super.key});
  // TabController tabController;

  @override
  Widget build(BuildContext context) {
      // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
      GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context)=> InsMaterialCubit(
        materialUseCase: getIt<InsMaterialUseCase>(),fileUseCase: getIt<InsMaterialFilesUseCase>(), 
        updateMaterialUseCase: getIt.get<UpdateMaterialUseCase>(), deleteMaterialUseCase: getIt.get<DeleteMaterialUseCase>(),
         addMaterialUseCase: getIt.get<AddMaterialUseCase>(),
        )..fetchAllMaterials(),

      child: BlocConsumer<InsMaterialCubit,MaterialsState>(
        listener: (context, state) => {},
        builder: (context, state) {      
         InsMaterialCubit cubit=InsMaterialCubit.get(context);
         TextEditingController materialController=TextEditingController();

          return DefaultTabController(
            length: 2, // Number of tabs
            initialIndex: cubit.tapBarIndex,
            child: Scaffold(
              floatingActionButton:CustomFloatingAction(type: 'Lecture', 
              formKey: formKey,
              onTap: (){
                         if (formKey
                             .currentState!
                             .validate()) {
                           InsMaterialCubit.get(context).addFolder(
                             folderName: materialController.text,   
                           ).then((value) {
                             Navigator.pop(context);
                           });   
                       }
              },
               materialController: materialController,),

                body: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      DefaultAppBar(context:context),
                      const SizedBox(height: 30,),
                      const ScreenPath(from: 'Materials',to: 'Folders',)    , 
                      const SizedBox(height: 15,),
                      TapBarWidget(onTap: (index) { 
                        cubit.changeTabBar(index: index);
                         }, tapIndex: cubit.tapBarIndex,),
                       const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    LectureBuilder(),
                    LabBuilder(),
                  ],
                ),
              ),
                   ],
                  ),
                )),
          
          );
        },
      ),
    );
  }
}
