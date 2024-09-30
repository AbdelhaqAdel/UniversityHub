import 'package:flutter/material.dart';
import '../../domain/entities/grade_entity.dart';


List<DataCell> tableCell({required InsGradeEntity gradeEntity}) {
  return [
    DataCell(
      Container(
        padding: const EdgeInsets.only(right: 15),
        width: double.infinity,
        child: Text(
          gradeEntity.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    DataCell(
      SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${gradeEntity.grade ?? '--'}',
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  ];
}
