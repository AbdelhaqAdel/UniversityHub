import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/student/material/presentation/widgets/material_page_view.dart';

class LabBuilder extends StatelessWidget {
  const LabBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialCubit,MaterialsState>(builder: (context,state)
    {
     return MaterialGridView(
      context1: context,
      // material: FolderEntity()
      );
    }
    );

  }
}