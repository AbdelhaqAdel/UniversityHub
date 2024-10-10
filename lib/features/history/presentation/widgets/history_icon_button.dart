import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/history/presentation/widgets/recent_activity.dart';
import 'package:universityhup/features/history/presentation/widgets/show_history_dialog.dart';

class HistoryIconButton extends StatelessWidget {
  const HistoryIconButton({super.key,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, right: 20),
      child: IconButton(
        onPressed: () {
          ShowDialogFun.call(
            context: context,
            dialogWidget: RecentActivityDialog(cubitContext: context),
          );
        },
        icon: const FaIcon(FontAwesomeIcons.opencart),
      ),
    );
  }
}
