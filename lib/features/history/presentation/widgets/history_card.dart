import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/history/data/models/history_model.dart';
import 'package:universityhup/features/history/presentation/widgets/card_data.dart';

class HistoryCard extends StatelessWidget {
  final IconData icon;
  final HistoryModel history;
  final int index;
  final Function(int) onDismissed;

  const HistoryCard({
    super.key,
    required this.icon,
    required this.history,
    required this.index,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize= MediaQuery.of(context).size;
    return SizedBox(
      height:screenSize.height / 7,
      child: Dismissible(
        key: Key(history.hiveIndex.toString()),
        onDismissed: (direction) {
          onDismissed(index);
        },
        child: GlassBox(
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueGrey.withOpacity(.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      child: FaIcon(
                        icon,
                        color: KColors.c1Color,
                        size: 30.sp,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                CardData(history: history,),
              ],
            ),
          ),
          color: Colors.white.withOpacity(.5),
          borderRadius: 20,
          x: 10,
          y: 10,
          border: false,
        ),
      ),
    );
  }
}
