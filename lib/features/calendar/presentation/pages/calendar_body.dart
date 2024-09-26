import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';
import 'package:universityhup/features/calendar/domain/use_cases/add_to_calender_use_case.dart';
import 'package:universityhup/features/calendar/domain/use_cases/get_calender_use_case.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_cubit.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';
import 'package:universityhup/features/calendar/presentation/widgets/calendar_listview.dart';
import 'package:universityhup/features/calendar/presentation/widgets/calendar_table.dart';
import 'package:universityhup/features/calendar/presentation/widgets/floating_action_button.dart';

// ignore: must_be_immutable
class CalendarBody extends StatelessWidget {
    CalendarBody({super.key});
  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();
   
  var eventBodyController = TextEditingController();
  var formKey = GlobalKey<FormState>();
    List<CalendarEntity> events=[];  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CalendarCubit(getEventsUseCase: getIt.get<GetCalendarDayEventsUseCase>(),
       addEventUseCase: getIt.get<AddEventToCalendarUseCase>())..getDayEvents(),
      child: BlocConsumer<CalendarCubit, CalendarState>(
        listener: (context, state) => {
          if(state is GetEventsSuccessState){
            events=state.events
          }
        },
        builder: (context, state) {
          return Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.transparent,
              floatingActionButton: CustomFloatingAction(),
              body:  SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Column(
                    children: [
                       CalendarTable(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child:
                          ConditionalBuilder(
                               condition:events.isNotEmpty &&state is!GetEventsLoadingState,
                               builder:(context){
                                return CalendarListView(events: events,);},
                           fallback:(context) {
                             if (events.isEmpty && state is! GetEventsLoadingState) {
                               return
                                 const Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Center(child: Text('No Event here..'),),
                                   ],
                                 );
                             } else {
                               return  const Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Center(child: CircularProgressIndicator()),
                                 ],
                               );
                             }
                           }
                        ),
                      
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
