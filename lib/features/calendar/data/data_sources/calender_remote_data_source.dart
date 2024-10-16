import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/calendar/data/models/calender_model.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';

abstract class CalenderRemoteDataSource {
   Future<String> addEventToCalendar({required CalendarEntity calendarEntity});
    Future<List<CalendarEntity>> getCalendarDayEvents(String startDate, String endDate);
}  

class CalenderRemoteDataSourceImpl extends CalenderRemoteDataSource {

  List<CalendarEntity>dayEvents=[];  
  @override
  Future<List<CalendarEntity>> getCalendarDayEvents(String startDate, String endDate) async {
    await DioHelper.get(
      url: '${EndPoint.getCalendarEvents}$startDate&end=$endDate',
      token: token,
    ).then((value){
      print('----------------------');
      print(value.data);
      print('----------------------');

      fillCalenderList(value);
    });
    return dayEvents;
  }
   void fillCalenderList(Response<dynamic> list) {
   dayEvents=[];
     for (var element in list.data) {
     dayEvents.add(CalenderModel.fromJson(element));
    }
 }

@override
Future<String> addEventToCalendar({required CalendarEntity calendarEntity}) async {
  final CalenderModel calenderModel = CalenderModel(
    startDate: calendarEntity.startDate.toString(),
    endDate: calendarEntity.endDate.toString(),
    eventBody: calendarEntity.eventBody,
  );
  
  final response = await DioHelper.post(
    token: token,
    url: EndPoint.addToCalendar,
    data:calenderModel.toJson(),

  );
  return response.data;
}
}
