import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/widgets/screen_path.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/file%20widgets/add_file_widget.dart';
import '../manager/cubit/material_cubit.dart';
import '../widgets/file widgets/file_builder.dart';

class InsMaterialFileScreen extends StatelessWidget {
  const InsMaterialFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InsMaterialCubit,MaterialsState>(
      listener: (context, state) {
 
      },
      builder: (context, state) {
        InsMaterialCubit.get(context).pickedFile=null;
       GlobalKey<FormState> formKey = GlobalKey<FormState>();
        var screenSize=MediaQuery.of(context).size;
        return Scaffold(
            floatingActionButton:FileCustomFloatingAction( 
             formKey: formKey,
             onTap: (){
              if(InsMaterialCubit.get(context).pickedFile!=null){
                InsMaterialCubit.get(context).addFile().then((v){
                  Navigator.pop(context);
                });
              }else{
                InsMaterialCubit.get(context).pickMaterialFile();
               }
      },),
          body: SafeArea(
            child: Column(
              children: [
                 SizedBox(
                  height: screenSize.height * 0.03,
                ),
                DefaultAppBar(context: context),
                 SizedBox(
                  height: screenSize.height * 0.03,
                ),
                const ScreenPath(from: 'Folders',to: 'Files',), 
                 SizedBox(
                 height: screenSize.height * 0.015,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: FileBuilder(),
                    ),
                  ),

              ],
            ),
          ),
        );
      },
    );
  }
}
