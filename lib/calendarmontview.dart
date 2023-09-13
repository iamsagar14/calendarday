import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarMonthView extends StatefulWidget {
  const CalendarMonthView({Key? key}) : super(key: key);

  @override
  State<CalendarMonthView> createState() => _CalendarMonthViewState();
}

class _CalendarMonthViewState extends State<CalendarMonthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MonthView(
        width: MediaQuery.of(context).size.width,
        cellAspectRatio: 0.48,
        borderSize: 1,
        headerStyle: HeaderStyle(
          headerTextStyle: GoogleFonts.nunito()
              .copyWith(fontSize: 20, fontWeight: FontWeight.w100),
          headerPadding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.white),
        ),
        weekDayStringBuilder: (int day) {
          final weekdayNames = [
            'Mon',
            'Tue',
            'Wed',
            'Thu',
            'Fri',
            'Sat',
            'Sun',
          ];

          return weekdayNames[day]; // Adjust for 0-based indexing.
        },
        headerStringBuilder: (date, {secondaryDate}) {
          // Customize the header string here.
          return DateFormat.yMMMM().format(date);
        },
        dateStringBuilder: (date, {secondaryDate}) {
          // Customize the format of the day string here.
          return DateFormat('EEEE')
              .format(date); // Display only the day of the month.
        },
        borderColor: const Color(0xFFF5F5F5),
        controller: EventController(),
        showBorder: true,
        cellBuilder: (date, events, isToday, isInMonth) {
          final isHoliday = (date.weekday == DateTime.saturday);
          final specificholiday =
              (date.isAtSameMomentAs(DateTime(2023, 9, 4)) ||
                  date.isAtSameMomentAs(DateTime(2023, 9, 28)));
          final specificdayevent =
              (date.isAtSameMomentAs(DateTime(2023, 9, 6)) ||
                  date.isAtSameMomentAs(DateTime(2023, 9, 17)) ||
                  date.isAtSameMomentAs(DateTime(2023, 9, 25)) ||
                  date.isAtSameMomentAs(DateTime(2023, 9, 1)) ||
                  date.isAtSameMomentAs(DateTime(2023, 9, 22)) ||
                  date.isAtSameMomentAs(DateTime(2023, 9, 29)));
          final backgroundColor = isHoliday
              ? const Color(0xFFF5D7D7)
              : (isToday
                  ? const Color(0xFF29A9DB)
                  : specificholiday
                      ? Colors.orange.withOpacity(0.4)
                      : null);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      date.day.toString(), // Display the day of the month.
                      style: GoogleFonts.nunito().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                if (specificdayevent)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: const Color(0xFFD4EEF8),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        ' 5 Session',
                        style: GoogleFonts.nunito().copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },

        minMonth: DateTime(2020, 1, 1),
        maxMonth: DateTime(2030, 1, 1),
        initialMonth: DateTime(2023, 9, 11),

        onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
        onCellTap: (events, date) {
          // Implement callback when user taps on a cell.
          print(date);
        },
        startDay: WeekDays.sunday, // To change the first day of the week.
        // This callback will only work if cellBuilder is null.
        onEventTap: (event, date) => print(event),
        onDateLongPress: (date) => print(date),
      ),
    );
  }
}
