import 'package:flutter/material.dart';
import 'package:uptodo/pages/calendar_screen.dart';
import 'package:uptodo/pages/clock_scren.dart';
import 'package:uptodo/pages/components/form_add_todo.dart';
import 'package:uptodo/pages/home_page.dart';
import 'package:uptodo/pages/profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void addTask() {
    showDialog(context: context, builder: (context) => const FormAddTodo());
  }

  int pageIndex = 0;

  final pages = [HomePage(), const CalendarScreen(), ClockScren(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff363636),
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },

        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.white,

        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white, // important pour garder cohérence
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFFFFFDE), size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              color: Color(0xFFFFFFDE),
              size: 24,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer, color: Color(0xFFFFFFDE), size: 24),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: Color(0xFFFFFFDE),
              size: 24,
            ),
            label: 'User',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff8687E7),
        onPressed: addTask,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
