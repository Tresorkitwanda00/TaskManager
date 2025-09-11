import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uptodo/data/data.dart';
import 'package:uptodo/pages/home_page.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentMonth = DateTime.now();
  final Map<int, FixedExtentScrollController> _controllers = {};
  final data = Data();
  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 7; i++) {
      _controllers[i] = FixedExtentScrollController(initialItem: 0);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  // Récupère tous les jours d'un mois correspondant à un weekday (1=Lundi ... 7=Dimanche)
  List<DateTime> _daysForWeekday(DateTime month, int weekday) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);

    List<DateTime> result = [];
    DateTime day = firstDay;

    while (day.weekday != weekday && day.isBefore(lastDay)) {
      day = day.add(const Duration(days: 1));
    }

    while (day.month == month.month) {
      result.add(day);
      day = day.add(const Duration(days: 7));
    }

    return result;
  }

  void _prevMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
      for (var controller in _controllers.values) {
        controller.jumpToItem(0);
      }
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
      for (var controller in _controllers.values) {
        controller.jumpToItem(0);
      }
    });
  }

  bool? iscompleted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Calendar',
              style: TextStyle(
                color: Color(0xFFFFFFDE),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Color(0xff363636),
              height: 107,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: _prevMonth,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMM().format(_currentMonth),
                        style: const TextStyle(
                          color: Color(0xFFFFFFDE),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: _nextMonth,
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFFFFFDE),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: Row(
                      children: List.generate(7, (index) {
                        final weekday = index + 1; // 1=Lundi ... 7=Dimanche
                        final days = _daysForWeekday(_currentMonth, weekday);

                        if (days.isEmpty) return const SizedBox.shrink();

                        return Expanded(
                          child: Column(
                            children: [
                              // Nom du jour
                              Text(
                                DateFormat.E().format(days.first),
                                style: const TextStyle(
                                  color: Color(0xFFFFFFDE),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Expanded(
                                  child: CupertinoPicker(
                                    scrollController: _controllers[weekday],
                                    itemExtent: 32,
                                    backgroundColor: Colors.transparent,
                                    onSelectedItemChanged: (selectedIndex) {
                                      if (selectedIndex < days.length) {
                                        debugPrint(
                                          "Jour choisi : ${DateFormat.E().format(days[selectedIndex])} ${days[selectedIndex].day}",
                                        );
                                      }
                                    },
                                    children: days
                                        .map(
                                          (d) => Center(
                                            child: Text(
                                              "${d.day}",
                                              style: const TextStyle(
                                                color: Color(0xFFFFFFDE),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.only(left: 10, top: 15, bottom: 16),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xff363636),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 137,
                    height: 49,

                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          iscompleted = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (iscompleted == true)
                            ? Color(0xff8687E7)
                            : Color(0xff363636),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),

                      child: Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 42),
                  SizedBox(
                    width: 137,
                    height: 49,

                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          iscompleted = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (iscompleted == false)
                            ? Color(0xff8687E7)
                            : Color(0xff363636),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: (iscompleted == true)
                  ? data.buildListTaskLeft()
                  : data.buildListDone(),
            ),
          ],
        ),
      ),
    );
  }
}
