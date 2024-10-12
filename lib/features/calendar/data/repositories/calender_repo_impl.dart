import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/calendar/data/data_sources/calender_remote_data_source.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';
import 'package:universityhup/features/calendar/domain/repositories/calender_repo.dart';

class CalendarRepositoryImpl implements CalendarRepository {

   final CalenderRemoteDataSourceImpl calenderRemoteDataSourceImpl;
  CalendarRepositoryImpl({required this.calenderRemoteDataSourceImpl});   


  @override
  Future<Either<Failure, List<CalendarEntity>>> getCalendarDayEvents(String startDate, String endDate) async {
    try{
    final response=await calenderRemoteDataSourceImpl.getCalendarDayEvents(startDate, endDate);
     return Right(response);
    }catch(error){
       if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }
    }
  }

    @override
  Future<Either<Failure, String>> addEventToCalendar({required calendarEntity}) async {
    try{
     final response= await calenderRemoteDataSourceImpl.addEventToCalendar(calendarEntity: calendarEntity );
      return right(response);
  }catch(error){
       if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }
    }
  }
  }

