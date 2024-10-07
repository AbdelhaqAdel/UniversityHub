

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/textStyles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.index,
    required this.iconData,
    required this.itemIndex,
  });
  final String title;
  final int index;
  final int itemIndex;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index == itemIndex
                ? Colors.lightBlue
                : Colors.transparent
        ),
        alignment: AlignmentDirectional.topStart,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(width: 10),
              FaIcon(
                iconData,
                size: 20,
                color: index == itemIndex
                    ? Colors.white
                    : KColors.primaryColor.withOpacity(.8),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: Styles.textStyle20.copyWith(
                    color: index == itemIndex
                        ? Colors.white
                        : KColors.primaryColor.withOpacity(.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
