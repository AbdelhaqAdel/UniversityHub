import 'package:flutter/material.dart';

List<DataColumn> tableColumns(BuildContext context) {
  return [
    DataColumn(
      label: SizedBox(
        width: MediaQuery.of(context).size.width * .50,
        child: Column(
          children: [
            Text(
              'Task',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(
                color: Colors.teal,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            Container(
              height: 2,
              color: Colors.teal,
              width: double.infinity,
            ),
          ],
        ),
      ),
    ),
    DataColumn(
      label: SizedBox(
        width: MediaQuery.of(context).size.width * .35,
        child: Column(
          children: [
            Text(
              'Grade',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(
                color: Colors.teal,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            Container(
              height: 2,
              color: Colors.teal,
              width: double.infinity,
            ),
          ],
        ),
      ),
    ),
  ];
}
