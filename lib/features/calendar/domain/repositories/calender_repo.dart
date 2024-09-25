import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';

abstract class CalendarRepository {

  Future<Either<Failure, List<CalendarEntity>>> getCalendarDayEvents(String startDate, String endDate);

  Future<Either<Failure, String>> addEventToCalendar({required String startDate, required String endDate, required String eventBody});

}
