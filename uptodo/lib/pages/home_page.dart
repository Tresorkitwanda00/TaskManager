import 'package:flutter/material.dart';
import 'package:uptodo/data/data.dart';
import 'package:uptodo/pages/components/form_add_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addTask() {
    showDialog(context: context, builder: (context) => const FormAddTodo());
  }

  final data = Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (data.index.isNotEmpty)
          ? _buildListTaskView()
          : _buildHomePageView(),
    );
  }

  Widget _buildHomePageView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 57),
            child: SizedBox(
              width: double.infinity,
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/index_logo.png'),
                  ),
                  const Text(
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
          const SizedBox(height: 75),
          SizedBox(
            width: 227,
            height: 227,
            child: Image.asset('assets/images/Checklist-rafiki.png'),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
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
          const SizedBox(height: 10),
          GestureDetector(
            onTap: addTask,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 56),
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
      ),
    );
  }

  Widget _buildListTaskView() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xff121212)),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
            child: SizedBox(
              width: double.infinity,
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/index_logo.png'),
                  ),
                  const Text(
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
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff979797), width: 0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 24,
                      color: Color(0xff979797),
                    ),
                  ),
                  Text(
                    'Search for your task...',
                    style: TextStyle(
                      color: Color(0xffAFAFAF),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 31,
                    width: 76,
                    decoration: BoxDecoration(
                      color: const Color(0xff363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Image.asset('assets/images/arrow-down.png'),
                        const SizedBox(width: 12),
                        const Text(
                          'Today',
                          style: TextStyle(
                            color: Color(0xFFFFFFDE),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Liste des tâches
          Expanded(child: data.buildListTaskLeft()),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 31,
                    width: 85,
                    decoration: BoxDecoration(
                      color: const Color(0xff363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Image.asset('assets/images/arrow-down.png'),

                        const Text(
                          'Completed',
                          style: TextStyle(
                            color: Color(0xFFFFFFDE),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Liste des tâches
          Expanded(child: data.buildListDone()),
        ],
      ),
    );
  }
}
