import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,    required this.tabController,
  });
  final TabController tabController;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller:widget.tabController ,
      onTap: (index) {
        setState(() {
        });
        },
      indicatorColor:
      widget.tabController.index==0? Colors.red : Colors.teal,
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
                color: widget.tabController.index == 0
                    ? Colors.red
                    : Colors.black.withOpacity(.6),
                size: widget.tabController.index == 0 ? 25 : 22,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Pending',
                style: TextStyle(
                  fontSize: widget.tabController.index == 0 ? 20 : 18,
                  color: widget.tabController.index == 0
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
                color:widget.tabController.index == 1
                    ? Colors.teal
                    : Colors.black.withOpacity(.6),
                size: widget.tabController.index == 1 ? 25 : 22,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Complete',
                style: TextStyle(
                  fontSize: widget.tabController.index == 1 ? 20 : 18,
                  color: widget.tabController.index == 1
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
