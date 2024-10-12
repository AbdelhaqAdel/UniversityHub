import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';
import 'package:universityhup/features/calendar/domain/repositories/calender_repo.dart';

class GetCalendarDayEventsUseCase {
  final CalendarRepository calendarRepo;

  GetCalendarDayEventsUseCase(this.calendarRepo);
   Future<Either<Failure, List<CalendarEntity>>> call([String? startDate,String? endDate]) {
     return calendarRepo.getCalendarDayEvents(startDate!, endDate!);

  }
}
