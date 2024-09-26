import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_cubit.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';

class SelectDateButtons extends StatelessWidget {
  const SelectDateButtons({super.key,required this.time,required this.focusDay});
   final Time time ;
   final DateTime focusDay;
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.sizeOf(context);
    return  
       SizedBox(
      height: screenSize.height/15,
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            color: Colors.teal.withOpacity(.7),
            fontSize: 20.sp,
            onTap: () { 
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: time,
                  sunrise: const TimeOfDay(hour: 6, minute: 0), 
                  sunset: const TimeOfDay(hour: 18, minute: 0), 
                  duskSpanInMinutes: 120, 
                  onChange: (value) {
                    CalendarCubit.get(context).startDate = DateFormat(
                            "yyyy-MM-ddT${value.hour}:${value.minute}:${value.second}0.000")
                        .format(ChangeCalenderDayState.thisFocusDay);
                  },
                ),
              );
            },
            text: 'Start',
          )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: CustomButton(
                  color: Colors.red.withOpacity(.7),
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: time,
                        sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
                        sunset: const TimeOfDay(hour: 18, minute: 0), // optional
                        duskSpanInMinutes: 120, // optional
                        onChange: (value) {
                          CalendarCubit.get(context).endDate =
                              DateFormat("yyyy-MM-ddT${value.hour}:${value.minute}:${value.second}0.000").format(ChangeCalenderDayState.thisFocusDay);
                        },
                      ),
                    );
                  },
                  text: 'End',
                  fontSize: 20.sp)),
        ],
      ),
    );
  }
}
