import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';

class CalenderModel extends CalendarEntity {

  CalenderModel(
      {
        required super.startDate,
        required super.endDate,
       required super.eventBody});

  factory CalenderModel.fromJson(Map<String, dynamic> json) {
    return CalenderModel(

    startDate : json['start'],
    endDate : json['end'],
    eventBody : json['body'],
    );
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start'] = startDate;
    data['end'] = endDate;
    data['body'] = eventBody;
    return data;
  }
}

