import 'package:flutter/material.dart';
import 'package:universityhup/features/instructor_role/grade/domain/entities/grade_entity.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/table_cell.dart';
import 'package:universityhup/features/instructor_role/grade/presentation/widgets/table_columns.dart';

class GradeTableWidget extends StatelessWidget {
  const GradeTableWidget({super.key, required this.stuGrades});
  final List<InsGradeEntity> stuGrades;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            headingRowHeight: 50,
            horizontalMargin: 0,
            columnSpacing: 0,
            headingRowColor: MaterialStateProperty.all(Colors.transparent),
            dataRowMaxHeight: 75,
            dataRowMinHeight: 60,
            dividerThickness: 0.2,
            border: const TableBorder(
              verticalInside: BorderSide(color: Colors.teal, width: 2),
            ),
            columns: tableColumns(context),
            rows: List<DataRow>.generate(
              stuGrades.length,
              (index) => DataRow(
                cells: tableCell(gradeEntity: stuGrades[index]),
              ),
            ),
          ),
        ),
      
    );
  }
}
