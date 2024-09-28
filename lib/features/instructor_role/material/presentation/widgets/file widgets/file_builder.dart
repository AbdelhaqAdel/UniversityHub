
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/file%20widgets/file_grid_view.dart';

class FileBuilder extends StatelessWidget {
  const FileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsMaterialCubit,MaterialsState>(builder: (context,state)
    {
        if(state is GetAllFilesSuccessState){
        return FileGridView(
      context1: context, files: state.files,
      );}else if(state is GetAllFilesErrorState){
        return Center(child: Text(state.error));
      }else{
        return const Center(child: CircularProgressIndicator());
      }
    }
    );

  }
}