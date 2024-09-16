import 'package:flutter/material.dart';
import 'package:universityhup/core/style/colors.dart';


class FileWidget extends StatelessWidget {
  const FileWidget({super.key,
  //  required this.folder, required this.file
   });
  // final FolderEntity folder;
  // final FileEntity file;
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.blueGrey.withOpacity(.15),
    ),
    padding: const EdgeInsets.all(6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          height: screenSize.height/7.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: KColors.subTitleColor.withOpacity(.7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
              'file name'
            ),
          ),
        
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                 'file name',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                      '12/12/',
                  style:Theme.of(context).textTheme.labelSmall,)
              ],
            ),
          ),
        ),
   
   ])
    );
  
  }
}


