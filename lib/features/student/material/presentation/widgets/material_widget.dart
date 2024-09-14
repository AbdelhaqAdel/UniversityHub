import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({
    // required this.material,
    required this.index,
    super.key});
      // final FolderEntity material;
      final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: .5),
        ),
        child: Container(
          //height: 150,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              FaIcon(
                FontAwesomeIcons.solidFolderClosed,
                color: KColors.subTitleColor,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  maxLines: 2,
                  'material name',
                  // ${material.lectureName}
                  
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: KColors.c1Color,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
       
            ],
          ),
        ),
      ),
    );
  }
}

