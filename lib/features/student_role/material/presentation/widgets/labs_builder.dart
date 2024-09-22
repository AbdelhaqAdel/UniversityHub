import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/cubit/material_cubit.dart';
import 'material_page_view.dart';

class LabBuilder extends StatelessWidget {
  const LabBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialCubit,MaterialsState>(builder: (context,state){
      if(GetAllMaterialsSuccessState.allLabs.isNotEmpty){
        return MaterialGridView(
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