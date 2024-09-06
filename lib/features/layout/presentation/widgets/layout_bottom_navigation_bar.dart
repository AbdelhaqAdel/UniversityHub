import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/style/colors.dart';
import '../manager/layout_cubit/layout_cubit.dart';

class LayoutNavigationBar extends StatefulWidget {
  const LayoutNavigationBar({
    super.key,
  });

  @override
  State<LayoutNavigationBar> createState() => _LayoutNavigationBarState();
}

class _LayoutNavigationBarState extends State<LayoutNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12.0,
        right: 12,
        left: 12,
      ),
      child:  Container(
        width:  MediaQuery.of(context).size.width < 450
            ?  MediaQuery.of(context).size.width:  450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 10)
              // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          selectedFontSize: 17,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          selectedIconTheme:
          const IconThemeData(color: KColors.secondaryColor, size: 27),
          unselectedIconTheme:
          const IconThemeData(
              color: Colors.grey, size: 25),
          unselectedLabelStyle: const TextStyle(
            color: KColors.secondaryColor,
          ),
          unselectedFontSize: 15,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          currentIndex: LayoutCubit.get(context).currentNavigationBarIndex,

          onTap: (index) {
            setState(() {
              LayoutCubit.get(context).onTapNavigationBar(index);
            });

          },
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bookOpen),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.calendar),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon:  FaIcon(FontAwesomeIcons.user),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}