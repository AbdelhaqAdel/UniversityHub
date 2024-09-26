import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_cubit.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';

class CalendarTable extends StatelessWidget {
   CalendarTable({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
           padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.blueGrey.withOpacity(.6),
                        width: 3)),
              ),
              child:
                  TableCalendar(
                availableCalendarFormats: const {
                  CalendarFormat.week: 'less',
                  CalendarFormat.month: 'more'
                },
                formatAnimationCurve: Curves.easeIn,
                pageJumpingEnabled: true,
                headerStyle: const HeaderStyle(
                    decoration: BoxDecoration(),
                    formatButtonVisible: true,
                    titleCentered: true),
                calendarStyle: CalendarStyle(
                    defaultTextStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    todayDecoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(.4),
                        border:Border.all(color: Colors.blueGrey, width: 1),
                        shape: BoxShape.circle), ),
      
                focusedDay:ChangeCalenderDayState.thisFocusDay,
                currentDay:ChangeCalenderDayState.thisFocusDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 1, 1),
                    rowHeight: 50,
                    daysOfWeekHeight: 40,
                    pageAnimationEnabled: true,
                    pageAnimationCurve: Curves.easeIn,
                      onDaySelected: (selectedDay, focusedDay) {
                   CalendarCubit.get(context).selectCalenderDay(focusDay: focusedDay);
                   CalendarCubit.get(context).getDayEvents();
                },
                onFormatChanged: (format) {
                   CalendarCubit.get(context).changeCalenderFormat();
                },
                calendarFormat:  CalendarCubit.get(context).isMonthFormat
                    ? CalendarFormat.month
                    : CalendarFormat.week,
              ),
            );}
}