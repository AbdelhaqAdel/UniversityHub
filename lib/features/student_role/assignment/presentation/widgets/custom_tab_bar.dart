import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}
int assignmentTabIndex=0;
class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        setState(() {
          assignmentTabIndex=index;

        });
        },
      indicatorColor:
      assignmentTabIndex==0? Colors.red : Colors.teal,
      indicatorWeight: 5,
      splashBorderRadius: BorderRadius.circular(25),
      indicatorSize: TabBarIndicatorSize.label,
      splashFactory: NoSplash.splashFactory,
      tabs:  [
        Tab(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.clock,
                color: assignmentTabIndex == 0
                    ? Colors.red
                    : Colors.black.withOpacity(.6),
                size: assignmentTabIndex == 0 ? 25 : 22,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Pending',
                style: TextStyle(
                  fontSize: assignmentTabIndex == 0 ? 20 : 18,
                  color: assignmentTabIndex == 0
                      ? Colors.red
                      : Colors.black.withOpacity(.6),
                ),
              ),
            ],
          ),
        ),
        Tab(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.circleCheck,
                color:assignmentTabIndex == 1
                    ? Colors.teal
                    : Colors.black.withOpacity(.6),
                size: assignmentTabIndex == 1 ? 25 : 22,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Complete',
                style: TextStyle(
                  fontSize: assignmentTabIndex == 1 ? 20 : 18,
                  color: assignmentTabIndex == 1
                      ? Colors.teal
                      : Colors.black.withOpacity(.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
