import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/functions/store_to_history.dart';

import '../../../../../../core/functions/open_file.dart';

class OpenStudentTask extends StatelessWidget {
  const OpenStudentTask({
    super.key,
    required this.filePath,
  });

  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          downloadAndOpenFile(filePath);
          StoryServices.insStoreHistoryToHive(materialName: 'File name: ${filePath.split('/').last}', 
          historyMessage: 'New student task downloaded');
        },
        child: Container(
          padding:
          const EdgeInsets
              .symmetric(
              vertical: 5,
              horizontal: 10),
          alignment:
          Alignment.center,
          height: 60,
          decoration:
          BoxDecoration(
            // border: Border.all(color: Colors.white),
            borderRadius:
            BorderRadius
                .circular(18),
            color: Colors.white
                .withOpacity(.5),
          ),
          child: const Padding(
            padding:
            EdgeInsets
                .symmetric(
                horizontal:
                0.0),
            child: Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                FaIcon(FontAwesomeIcons
                    .folderOpen),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Open File',
                  style:
                  TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}