import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student_role/grade/presentation/widgets/table_cell.dart';
import 'package:universityhup/features/student_role/grade/presentation/widgets/table_columns.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../domain/entities/grade_entity.dart';
import '../manager/grade_cubit.dart';
import '../manager/grade_state.dart';

class GradeTable extends StatefulWidget {
  const GradeTable({super.key});

  @override
  State<GradeTable> createState() => _GradeTableState();
}

class _GradeTableState extends State<GradeTable> {
  List<GradeEntity> gradeEntity = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradeCubit, GradeState>(
      listener: (context, state) {
        if (state is GetGradeSuccessState) {
          gradeEntity = state.gradeEntity;
        }
      },
      builder: (context, state) {
        if (gradeEntity.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: DataTable(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              headingRowHeight: 50,
              horizontalMargin: 0,
              columnSpacing: 0,
              headingRowColor: WidgetStateProperty.all(Colors.transparent),
              dataRowMaxHeight: 75,
              dataRowMinHeight: 60,
              dividerThickness: .2,
              border: const TableBorder(
                verticalInside: BorderSide(color: Colors.teal, width: 2),
              ),
              columns: tableColumns(context),
              rows: List<DataRow>.generate(
                gradeEntity.length,
                    (index) => DataRow(cells: tableCell( gradeEntity: gradeEntity[index])),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }


}
