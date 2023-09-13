import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';

class DayCalendar extends StatefulWidget {
  const DayCalendar({Key? key}) : super(key: key);

  @override
  State<DayCalendar> createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  late final EventController eventController;

  @override
  void initState() {
    eventController = EventController()
      ..addAll(
        <CalendarEventData>[
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 0)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 60)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 65)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 120)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 125)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 180)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 182)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 240)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 242)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 300)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 302)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 360)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 362)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 420)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 422)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 480)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 482)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 540)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 542)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 600)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 602)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 660)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 662)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 720)),
          ),
          CalendarEventData(
            title: "Event 2",
            date: DateTime.now(),
            startTime: DateTime(2023, 9, 11).add(const Duration(minutes: 722)),
            endTime: DateTime(2023, 9, 11).add(const Duration(minutes: 780)),
          ),
        ],
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DayView(
          minuteSlotSize: MinuteSlotSize.minutes60,
          showHalfHours: false,
          showVerticalLine: false,
          startDuration: const Duration(hours: 0),
          hourIndicatorSettings: const HourIndicatorSettings(
            height: 1, // Customize the height of the hour indicator
            color: Color(0xFFF5F5F5), dashWidth: 200, 
            lineStyle: LineStyle.solid,
            // Customize the interval between hour indicators
          ),

          headerStyle: HeaderStyle(
            headerTextStyle: GoogleFonts.nunito()
                .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
            headerPadding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Colors.white),
          ),
          dateStringBuilder: (date, {secondaryDate}) =>
              DateFormat('d MMM y, EEEE').format(date),
          timeLineBuilder: (dateTime) {
            int hour = dateTime.hour;
            return Container(
              child: Text(
                '$hour:00 AM', // Display the hour
                style: const TextStyle(color: Colors.black),
              ),
            );
          },

          controller: eventController,
          eventTileBuilder: (date, events, boundry, start, end) {
            if ((start.hour >= 1 && end.hour <= 3)) {
              return Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF4FBFD),
                    borderRadius: BorderRadius.circular(10)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12.5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn0.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcQfX7Wx_Tnxy8ZyJmP0jW4pVaLeGEw3TaLPtOo9Y8XuqUyeQ6ZG7t47rtA5FE83860bVPqWuhWkZCXF96g&psig=AOvVaw0PjrmrhUs3M6SphyivuohA&ust=1694255840007000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCNDiwv3omoEDFQAAAAAdAAAAABAE'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Nicholos Amazon',
                            style: GoogleFonts.nunito().copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.person,
                                color: Color(0xFf29A9DB),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '30 years, Female',
                                style: GoogleFonts.nunito().copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFF4FBFD),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Nicholos Amazon',
                              style: GoogleFonts.nunito().copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.person,
                              color: Color(0xFf29A9DB),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '30 years, Female',
                              style: GoogleFonts.nunito().copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: DottedBorder(
                      dashPattern: const [6, 6],
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      color: const Color(0xFf29A9DB),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFf29A9DB),
                              width: 1, // Adjust the border width as needed
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Color(0xFf29A9DB),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          },
          // To display live time line in all pages in day view.
          minDay: DateTime(2020, 1, 1),
          maxDay: DateTime(2030, 1, 1),
          initialDay: DateTime(2023, 9, 11),
          showLiveTimeLineInAllDays: false,
          heightPerMinute: 2.5, // height occupied by 1 minute time span.
          eventArranger:
              const SideEventArranger(), // To define how simultaneous events will be arranged.
          onEventTap: (events, date) => print(events),
          onDateLongPress: (date) => print(date),

          // dayTitleBuilder: (date) {
          //   return Text(date.toString());
          // },
        ),
      ),
    );
  }
}
