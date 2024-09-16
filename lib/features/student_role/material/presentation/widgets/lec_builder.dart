import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubit/material_cubit.dart';
import 'material_page_view.dart';

class LectureBuilder extends StatelessWidget {
  const LectureBuilder({super.key});

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