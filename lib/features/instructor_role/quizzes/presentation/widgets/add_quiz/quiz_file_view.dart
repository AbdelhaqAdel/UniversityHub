

import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../core/widgets/glass_box.dart';

Widget AssignFileViewWidget(
    index,
    context,
    File file,
    ) {
  final kb = file.lengthSync() / 1024;
  final mb = kb / 1024;
  final fileSize =
  mb >= 1 ? '${mb.toStringAsFixed(2)} MB ' : '${kb.toStringAsFixed(2)} KB';
  final extension = file.path.split('.').last;
  final color = Colors.blueGrey.withOpacity(.5);
  return InkWell(
    // onTap: () => App_cubit.get(context).openFile_Fun(file: file),
    child: GlassBox(
      widget: Container(
        width: 140,
        height: 140,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '.$extension',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            Text(
              file.path.split('/').last,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              fileSize,
              //fileSize,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
      color: Colors.white.withOpacity(.2),
      borderRadius: 20,
      x: 0,
      y: 0, border: true,),
  );
}