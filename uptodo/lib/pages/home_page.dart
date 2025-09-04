import 'package:flutter/material.dart';
import 'package:uptodo/pages/components/form_add_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageindex = 0;
  List<int> test = [1, 3, 4];
  void addTask() {
    showDialog(context: (context), builder: (context) => FormAddTodo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (test.isNotEmpty) ? _buildHomePageView() : _buildListTaskView(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff363636),
        type: BottomNavigationBarType.fixed,
        currentIndex: pageindex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home-2.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/calendar.png'),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/clock.png'),
            label: 'Clook',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/user.png'),
            label: 'User',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff8687E7),
        onPressed: addTask,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHomePageView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(left: 24, right: 24, top: 57),
          child: SizedBox(
            width: 327,
            height: 42,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/index_logo.png'),
                ),
                Text(
                  'Index',
                  style: TextStyle(
                    color: Color(0xFFFFFFDE),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Image.asset('assets/images/profil.png'),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(left: 50, top: 75, right: 50),
          child: SizedBox(
            width: 227,
            height: 227,
            child: Image.asset('assets/images/Checklist-rafiki.png'),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(left: 22, top: 10, right: 22),
          child: Text(
            'What do you want to do today?',
            style: TextStyle(
              color: Color(0xFFFFFFDE),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(left: 55, top: 10, right: 56),
          child: GestureDetector(
            onTap: addTask,
            child: Text(
              'Tap + to add your tasks',
              style: TextStyle(
                color: Color(0xFFFFFFDE),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListTaskView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(left: 24, right: 24, top: 57),
          child: SizedBox(
            width: 327,
            height: 42,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/index_logo.png'),
                ),
                Text(
                  'Index',
                  style: TextStyle(
                    color: Color(0xFFFFFFDE),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Image.asset('assets/images/profil.png'),
              ],
            ),
          ),
        ),
        ListView.builder(
          itemCount: test.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(test[index].toString()));
          },
        ),
      ],
    );
  }
}
