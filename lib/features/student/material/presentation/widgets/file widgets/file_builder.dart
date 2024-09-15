import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/student/material/presentation/widgets/file%20widgets/file_list_view.dart';

class FileBuilder extends StatelessWidget {
  const FileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialCubit,MaterialsState>(builder: (context,state)
    {
     return FileGridView(
      context1: context,
      // material: FolderEntity()
      );
    }
    );

  }
}