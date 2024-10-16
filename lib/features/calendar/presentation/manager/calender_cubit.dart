import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/store_to_history.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';
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
  required String eventBody,
}) async {
  emit(AddEventLoadingState());
  final result = await addEventUseCase.call(
    CalendarEntity(
      startDate: startDate!,
      endDate: endDate!,
      eventBody: eventBody));
  result.fold(
    (error) {
        emit(AddEventErrorState(error.toString()));
    },
    (msg){
      StoryServices.addHistoryToUserHive(event:eventBody);
          emit(AddEventSuccessState());
    },
  );
}



  Future<void> getDayEvents() async {
    emit(GetEventsLoadingState());
    String defaultStartDate=DateFormat('yyyy-MM-${ChangeCalenderDayState.thisFocusDay.day}').format(ChangeCalenderDayState.thisFocusDay);
    String defaultEndDate=DateFormat('yyyy-MM-${ChangeCalenderDayState.thisFocusDay.day + 1}').format(ChangeCalenderDayState.thisFocusDay);
     print('$startDate      $endDate');
         print('$defaultStartDate      $defaultEndDate');

      final events = await getEventsUseCase.call(
      defaultStartDate,
      defaultEndDate);
      events.fold((error)=>emit(GetEventsErrorState(error.toString())),
       (allEvents){
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