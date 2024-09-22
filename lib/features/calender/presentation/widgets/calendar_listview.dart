import 'package:flutter/material.dart';
import 'package:universityhup/features/calender/domain/entities/calender_entity.dart';
import 'package:universityhup/features/calender/presentation/widgets/calendar_item.dart';

class CalendarListView extends StatelessWidget {
  const CalendarListView({super.key, required this.events,}); 
  final List<CalendarEntity> events;

  @override
  Widget build(BuildContext context) {
      List calenderColors1 = [
         Colors.lightBlueAccent.withOpacity(.18),
         Colors.pinkAccent.withOpacity(.12),
         Colors.greenAccent.withOpacity(.18),
         Colors.deepPurpleAccent.withOpacity(.18),
       ];
       List calenderColors2 = [
         Colors.blue,
         Colors.pinkAccent,
         Colors.green,
         Colors.deepPurple,
       ];
    return  ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => CalendarItem(
                  event:events[index] ,
                  color1: calenderColors1[(index + 1) % 4 == 0
                      ? 3
                      : (index + 1) % 4 == 1
                          ? 2
                          : (index + 1) % 4 == 2
                              ? 1
                              : 0],
                  color2: calenderColors2[(index + 1) % 4 == 0
                      ? 3
                      : (index + 1) % 4 == 1
                          ? 2
                          : (index + 1) % 4 == 2
                              ? 1
                              : 0]),
              separatorBuilder: (context, index) => Container(
                height: 15,
                color: Colors.transparent,
              ),
              itemCount: events.length,
            );
  }
}