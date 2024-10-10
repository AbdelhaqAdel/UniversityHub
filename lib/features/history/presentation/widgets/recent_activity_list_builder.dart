import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/features/history/data/models/history_model.dart';
import 'package:universityhup/features/history/presentation/widgets/history_card.dart';
import 'package:universityhup/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';

class RecentActivityList extends StatefulWidget {
  final BuildContext cubitContext;

  const RecentActivityList({super.key, required this.cubitContext});

  @override
  _RecentActivityListState createState() => _RecentActivityListState();
}

class _RecentActivityListState extends State<RecentActivityList> {
  late List<HistoryModel> activities;

  final List<IconData> recent = [
    FontAwesomeIcons.penClip,
    FontAwesomeIcons.bookBookmark,
    FontAwesomeIcons.featherPointed,
    FontAwesomeIcons.book,
    FontAwesomeIcons.bookBookmark,
    FontAwesomeIcons.penClip,
    FontAwesomeIcons.featherPointed,
    FontAwesomeIcons.book,
  ];

  @override
  void initState() {
    super.initState();
    activities = role == "Student"
        ? LayoutCubit.get(widget.cubitContext).getStuHistoryData()
        : LayoutCubit.get(widget.cubitContext).getInsHistoryData();
  }

  void removeItem({required int index}) {
    setState(() {
     activities.removeAt(index);
      if (role == "Student") {
        LayoutCubit.get(widget.cubitContext).stuDeleteHistory(
          hisIndex:index,
          context:context,
        );
      } else {
        LayoutCubit.get(widget.cubitContext).insDeleteHistory(
          hisIndex: index,
          context: context,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: activities.isNotEmpty,
      builder: (context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 15,
            bottom: 0,
            right: 15,
          ),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return HistoryCard(
                icon: recent[index < recent.length ? index : 0],
                history: activities[index],
                index: index,
                // Pass the removeItem method correctly
                onDismissed: (d) => removeItem(index: index),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: activities.length,
          ),
        ),
      ),
      fallback: (context) => const SizedBox(),
    );
  }
}
