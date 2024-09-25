import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';
import 'package:universityhup/features/calendar/domain/use_cases/add_to_calender_use_case.dart';
import 'package:universityhup/features/calendar/domain/use_cases/get_calender_usecase.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';
import 'package:intl/intl.dart' ;

class CalendarCubit extends Cubit<CalendarState> {
  
  static CalendarCubit get(context)=>BlocProvider.of(context);
  final AddEventToCalendarUseCase addEventUseCase;
  final GetCalendarDayEventsUseCase getEventsUseCase;
  CalendarCubit({required this.getEventsUseCase,required this.addEventUseCase}) : super(CalendarInitialState());

void addEvent({required String event, required String start, required String end}) async {
  if (!isClosed) {
    emit(AddEventLoadingState());
    final result = await addEventUseCase.call(event, startDate, endDate);
    getDayEvents();  
    result.fold(
      (error) {
        if (!isClosed) {
          emit(AddEventErrorState(error.toString()));
        }
      },
      (msg) {
        if (!isClosed) {
          emit(AddEventSuccessState());
        }
      },
    );
  }
}


  Future<List<CalendarEntity>> getDayEvents() async {
    emit(GetEventsLoadingState());
      final events = await getEventsUseCase.call(
      startDate??DateFormat('yyyy-MM-${ChangeCalenderDayState.thisFocusDay.day}THH:mm:ss.SSS').format(ChangeCalenderDayState.thisFocusDay), 
      endDate?? DateFormat('yyyy-MM-${ChangeCalenderDayState.thisFocusDay.day + 1}THH:mm:ss.SSS').format(ChangeCalenderDayState.thisFocusDay));
      events.fold((error)=>emit(GetEventsErrorState(error.toString())),
       (allEvents)=>emit(GetEventsSuccessState(events: allEvents)));
        if(events.runtimeType == List<CalendarEntity>){
          return events as List<CalendarEntity>;    
        }
        return [];
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