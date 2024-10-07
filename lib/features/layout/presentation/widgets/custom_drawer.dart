
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/functions/logout.dart';
import '../../../../core/widgets/glass_box.dart';
import 'drawer_header.dart';
import 'drawer_items.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int checkIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: GlassBox(
        widget: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const CustomDrawerHeader(),

                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.black.withOpacity(.2),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 600,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            break;
                          case 1:
                            break;
                          case 2:
                            break;
                          case 3:
                            break;
                          case 4:
                            clickOnLogout(context);
                            break;
                        }
                      },
                      child: DrawerItem(
                        title: drawerTitle[index],
                        index: checkIndex,
                        itemIndex: drawerIndex[index],
                        iconData: drawerIconData[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        color: Colors.white.withOpacity(.3),
        borderRadius: 20,
        x: 35,
        y: 40,
        border: false,
      ),
    );
  }

  void clickOnLogout(context) {
    GoRouter.of(context).pop();
    logout(context);
  }
}

const List<String> drawerTitle = [
  'Dashboard',
  'Edit Account',
  'History',
  'Setting',
  'Logout',
];
const List<IconData> drawerIconData = [
  FontAwesomeIcons.house,
  FontAwesomeIcons.solidUser,
  FontAwesomeIcons.chartSimple,
  FontAwesomeIcons.gear,
  FontAwesomeIcons.rightFromBracket,
];
const List<int> drawerIndex = [0, 1, 2, 3, 4];