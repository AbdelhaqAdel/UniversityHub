import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



Future<String?> dataTimePicker({required BuildContext context}) async {
  String? dateTime;

  // Show date picker
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022),
    lastDate: DateTime(2025),
    builder: (context, Widget? child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark().copyWith(
            primary: Colors.blue,
          ),
        ),
        child: child!,
      );
    },
  );

  // If a date is selected, show time picker
  if (selectedDate != null) {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 11, minute: 30),
    );

    if (selectedTime != null) {
      // Combine the selected date and time
      DateTime selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      // Format the selected date and time as a string
      dateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(selectedDateTime);
    }
  }

  return dateTime;
}
