import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDialog extends StatefulWidget {
  const CalendarDialog({super.key});

  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool isCalendar = true;

  int hours = 12;
  int minutes = 0;
  String period = 'AM';
  final List<String> periods = ['AM', 'PM'];

  final TextStyle pickerStyle = const TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(color: Colors.black45, offset: Offset(2, 2), blurRadius: 2),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFF272727), // fond sombre
        child: isCalendar ? _buildCalendarView() : _buildTimePickerView(),
      ),
    );
  }

  Widget _buildCalendarView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.white70),
            weekendStyle: TextStyle(color: Colors.redAccent),
          ),
          calendarStyle: const CalendarStyle(
            defaultTextStyle: TextStyle(color: Colors.white),
            weekendTextStyle: TextStyle(color: Colors.redAccent),
            todayDecoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF272727),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () => Navigator.pop(context, _selectedDay),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8687E7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () => setState(() => isCalendar = false),
              child: const Text(
                "Choose Time",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimePickerView() {
    return SizedBox(
      height: 206,
      width: 327,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Choose Time', style: TextStyle(color: Color(0xFFFFFFDE))),
          const SizedBox(height: 10),
          Container(height: 1, color: Color(0xFFFFFFDE), width: 306),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Picker heures
              SizedBox(
                height: 64,
                width: 64,
                child: CupertinoPicker(
                  backgroundColor: const Color(0xFF272727),
                  itemExtent: 60,
                  scrollController: FixedExtentScrollController(
                    initialItem: hours - 1,
                  ),
                  onSelectedItemChanged: (value) =>
                      setState(() => hours = value + 1),
                  children: List.generate(
                    12,
                    (index) => Center(
                      child: Text(
                        (index + 1).toString().padLeft(2, '0'),
                        style: pickerStyle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Picker minutes
              SizedBox(
                height: 120,
                width: 80,
                child: CupertinoPicker(
                  backgroundColor: const Color(0xFF272727),
                  itemExtent: 60,
                  scrollController: FixedExtentScrollController(
                    initialItem: minutes,
                  ),
                  onSelectedItemChanged: (value) =>
                      setState(() => minutes = value),
                  children: List.generate(
                    60,
                    (index) => Center(
                      child: Text(
                        index.toString().padLeft(2, '0'),
                        style: pickerStyle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Picker AM/PM
              SizedBox(
                height: 120,
                width: 80,
                child: CupertinoPicker(
                  backgroundColor: const Color(0xFF272727),
                  itemExtent: 60,
                  scrollController: FixedExtentScrollController(
                    initialItem: periods.indexOf(period),
                  ),
                  onSelectedItemChanged: (value) =>
                      setState(() => period = periods[value]),
                  children: periods
                      .map((e) => Center(child: Text(e, style: pickerStyle)))
                      .toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 133,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF272727),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () => setState(() => isCalendar = true),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Color(0xff8687E7),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 133,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff8687E7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $period",
                    );
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
