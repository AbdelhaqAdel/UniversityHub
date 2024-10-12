import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/functions/store_to_history.dart';
import 'package:universityhup/features/calendar/domain/use_cases/add_to_calender_use_case.dart';
import 'package:universityhup/features/calendar/domain/use_cases/get_calender_use_case.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';
import 'package:intl/intl.dart' ;

class CalendarCubit extends Cubit<CalendarState> {
  
  static CalendarCubit get(context)=>BlocProvider.of(context);
  final AddEventToCalendarUseCase addEventUseCase;
  final GetCalendarDayEventsUseCase getEventsUseCase;
  CalendarCubit({required this.getEventsUseCase,required this.addEventUseCase}) : super(CalendarInitialState());

void addEvent({
  required String event,
  required String start,
  required String end,
  required context,
}) async {
 // Prevents action if the Cubit is closed
  
  emit(AddEventLoadingState());
  
  final result = await addEventUseCase.call(event, start, end);
  
  result.fold(
    (error) {
        emit(AddEventErrorState(error.toString()));
    
    },
    (msg) async {
      try {

          if (role == "Student") {
            StoryServices.stuStoreHistoryToHive(
              materialName: 'Event title: $event',
              historyMessage: 'New event added',
            );
          } else {
            StoryServices.insStoreHistoryToHive(
              materialName: 'Event title: $event',
              historyMessage: 'New event added',
            );
          }
          emit(AddEventSuccessState());
        
      } catch (e) {
        if (!isClosed) {
          emit(AddEventErrorState('Failed to retrieve events: ${e.toString()}'));
        }
      }
    },
  );
}



  Future<void> getDayEvents() async {
    emit(GetEventsLoadingState());
      final events = await getEventsUseCase.call(
      startDate??DateFormat('yyyy-MM-${ChangeCalenderDayState.thisFocusDay.day}THH:mm:ss.SSS').format(ChangeCalenderDayState.thisFocusDay), 
      endDate?? DateFormat('yyyy-MM-${ChangeCalenderDayState.thisFocusDay.day + 1}THH:mm:ss.SSS').format(ChangeCalenderDayState.thisFocusDay));
      events.fold((error)=>emit(GetEventsErrorState(error.toString())),
       (allEvents){
        print('events--------${allEvents.length}');
        emit(GetEventsSuccessState(events: allEvents));});
        }

  String? startDate;
  String? endDate;
  void selectCalenderDay({
    required DateTime focusDay,
  }) {
     startDate= DateFormat('yyyy-MM-${focusDay.day}THH:mm:ss.SSS').format(focusDay);
     endDate= DateFormat('yyyy-MM-${focusDay.day + 1}THH:mm:ss.SSS').format(focusDay);
     ChangeCalenderDayState.setFocusDay(focusDay: focusDay);
     emit(ChangeCalenderDayState());
  }

  bool isMonthFormat = false;
  void changeCalenderFormat() async {
    isMonthFormat = !isMonthFormat;
    emit(ChangeCalenderFormatState());
  }
}