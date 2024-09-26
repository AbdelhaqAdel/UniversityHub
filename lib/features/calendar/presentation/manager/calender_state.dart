import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';

abstract class CalendarState {}

class CalendarInitialState extends CalendarState {}

class AddEventLoadingState extends CalendarState {}
class AddEventSuccessState extends CalendarState {
  
}
class AddEventErrorState extends CalendarState {
  final String error;
  AddEventErrorState(this.error);
}

class GetEventsLoadingState extends CalendarState {}
class GetEventsSuccessState extends CalendarState {
  final List<CalendarEntity> events;
  GetEventsSuccessState({required this.events});
}
class GetEventsErrorState extends CalendarState {
  final String message;
  GetEventsErrorState(this.message);
}

class ChangeCalenderDayState extends CalendarState {
  static DateTime thisFocusDay = DateTime.now();
  static void setFocusDay({required DateTime focusDay}){
     thisFocusDay=focusDay;  
  }
  ChangeCalenderDayState(); 
}

class ChangeCalenderFormatState extends CalendarState {}

class ChangeCalenderIndexState extends CalendarState {}
