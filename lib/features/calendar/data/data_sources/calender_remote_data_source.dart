import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/calendar/data/models/calender_model.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';

abstract class CalenderRemoteDataSource {
   Future<String> addEventToCalendar({required String startDate, required String endDate, required String eventBody});
    Future<List<CalendarEntity>> getCalendarDayEvents(String startDate, String endDate);
}  

class CalenderRemoteDataSourceImpl extends CalenderRemoteDataSource {

  List<CalendarEntity>dayEvents=[];  
  @override
  Future<List<CalendarEntity>> getCalendarDayEvents(String startDate, String endDate) async {
    await DioHelper.get(
      url: 'Calendar/GetByStartAndEnd?start=$startDate&end=$endDate',
      token: token,
    ).then((value){
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
  Future<String> addEventToCalendar({required String startDate, required String endDate, required String eventBody}) async {
     await DioHelper.post(token: token, url: EndPoint.addToCalendar,data: {
      'start': startDate.toString(),
      'end':  endDate.toString(),
      'body': eventBody,
    }).then((value) {
      return value.data;
    });
    return '';
  }
}
