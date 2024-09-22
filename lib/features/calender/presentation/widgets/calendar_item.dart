import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/features/calender/domain/entities/calender_entity.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({super.key, required this.event, required this.color1, required this.color2}); 
  final CalendarEntity event;
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color1,
        border: Border(
          left: BorderSide(color: color2, width: 6, style: BorderStyle.solid),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.circlePlay,
                  size: 17,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text('Event Data ... ',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w600,
                        fontSize: 12)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.circleQuestion,
                  size: 17,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(event.eventBody,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w600,
                        fontSize: 12)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.clock,
                  size: 17,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                    'From ${DateTime.parse(event.startDate).hour} : ${DateTime.parse(event.startDate).minute}'
                    ' to ${DateTime.parse(event.endDate).hour} : ${DateTime.parse(event.endDate).minute}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w600,
                        fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}