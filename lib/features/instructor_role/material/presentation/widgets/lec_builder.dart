

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/material_list_view.dart';

class LectureBuilder extends StatelessWidget {
  const LectureBuilder({super.key});

  @override
 Widget build(BuildContext context) {
    return BlocBuilder<InsMaterialCubit,MaterialsState>(builder: (context,state){
       if(state is GetAllMaterialsLoadingState){
        return const Center(child: CircularProgressIndicator());
      }
     else if(GetAllMaterialsSuccessState.allLectures.isNotEmpty){
        return MaterialListView(
        context1: context,
        materials:GetAllMaterialsSuccessState.allLectures,
      );}else if(state is GetAllMaterialsErrorState){
        return Center(child: Text(state.error));
      }else{
        return const Center(child: Text('No Lectures Found'));
      }
    }
    );

  }
}