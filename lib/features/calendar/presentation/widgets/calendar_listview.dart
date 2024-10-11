import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';
import 'package:universityhup/features/calendar/presentation/widgets/event_item.dart';

import '../manager/calender_cubit.dart';
import '../manager/calender_state.dart';

class CalendarListView extends StatefulWidget {
  const CalendarListView({super.key,});


  @override
  State<CalendarListView> createState() => _CalendarListViewState();
}

class _CalendarListViewState extends State<CalendarListView> {
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
    List<CalendarEntity> events=[];

    return BlocConsumer<CalendarCubit, CalendarState>(
      listener: (context, state) {
        // if (state is GetEventsSuccessState) {
        //   events = state.events;
        // }
        },
      builder: (context, state) {
        if (state is GetEventsSuccessState) {
          events = state.events;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  CalendarItem(
                      event: events[index],
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
              separatorBuilder: (context, index) =>
                  Container(
                    height: 15,
                    color: Colors.transparent,
                  ),
              itemCount: events.length,
            ),
          );
        }
       else if (events.isEmpty && state is GetEventsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('No Event here..'));
        }
      },
    );
  }
}