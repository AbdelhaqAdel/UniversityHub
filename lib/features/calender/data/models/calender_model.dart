import 'package:universityhup/features/calender/domain/entities/calender_entity.dart';

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
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['body'] = eventBody;
    return data;
  }
}


// class GetCalenderDayEventModel {
//   String? startDate;
//   String? endDate;
//   String? body;

//   GetCalenderDayEventModel({this.startDate, this.endDate, this.body});

//   GetCalenderDayEventModel.fromJson(Map<String, dynamic> json) {
//     startDate = json['start'];
//     endDate = json['end'];
//     body = json['body'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['startDate'] = this.startDate;
//     data['endDate'] = this.endDate;
//     data['body'] = this.body;
//     return data;
//   }
// }