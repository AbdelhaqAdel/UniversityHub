import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_cubit.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';
import 'package:universityhup/features/calendar/presentation/widgets/calendar_listview.dart';

class CalendarBuilder extends StatelessWidget {
  const CalendarBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit,CalendarState>(
      builder:(context,state){


        if(state is GetEventsSuccessState){
          if(state.events.isEmpty){
            return const Center(child: Text('No Events Found'),);
          }
          return CalendarListView(events: state.events,);
        }
        else if(state is GetEventsErrorState){
          return Text(state.message);
        }
        else if(state is GetEventsLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }else{
          return const Center(child: Text('No Events Found'),);
        }
       
      }
      );
  }
}