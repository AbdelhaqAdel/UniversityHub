import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';
import 'material_list_view.dart';

class LabBuilder extends StatelessWidget {
  const LabBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsMaterialCubit,MaterialsState>(builder: (context,state){
      if(GetAllMaterialsSuccessState.allLabs.isNotEmpty){
        return MaterialListView(
        context1: context,
        materials:GetAllMaterialsSuccessState.allLabs,
      );}else if(state is GetAllMaterialsErrorState){
        return Center(child: Text(state.error));
      }else if(state is GetAllMaterialsLoadingState){
        return const Center(child: CircularProgressIndicator());
      }else{
        return const Center(child: Text('No Labs Found'));
      }
    }
    );

  }
}