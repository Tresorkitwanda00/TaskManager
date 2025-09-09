import 'package:flutter/material.dart';
import 'package:uptodo/pages/components/form_add_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<int> index = [0, 1, 2];

  void addTask() {
    showDialog(
      context: context,
      builder: (context) => Dialog(child: FormAddTodo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (index.isNotEmpty) ? _buildListTaskView() : _buildHomePageView(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff363636),
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/home-2.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/calendar.png')),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/clock.png')),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/user.png')),
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
          Expanded(
            child: ListView.builder(
              itemCount: index.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 327,
                    height: 72,
                    margin: const EdgeInsets.only(
                      bottom: 8,
                      left: 24,
                      right: 24,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff363636),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),

                      // Cercle gauche
                      leading: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFFFFFFDE),
                            width: 1.5,
                          ),
                        ),
                      ),

                      // Texte principal (1 seule ligne)
                      title: Text(
                        index[i] == 0
                            ? 'Do Math Homework and Physics Exercises'
                            : index[i] == 1
                            ? 'Tack out dogs'
                            : index[i] == 2
                            ? 'Business meeting with CEO'
                            : '', // Exemple long
                        style: TextStyle(
                          color: Color(0xFFFFFFDE),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Sous-texte
                      subtitle: Text(
                        index[i] == 0
                            ? 'Today At 16:45'
                            : index[i] == 1
                            ? 'Today At 18:20'
                            : index[i] == 2
                            ? 'Today At 08:15'
                            : '',
                        style: TextStyle(
                          color: Color(0xffAFAFAF),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      // Boutons à droite
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 29,
                            decoration: BoxDecoration(
                              color: index[i] == 0
                                  ? Color(0xff809CFF)
                                  : index[i] == 1
                                  ? Color(0xffFF8080)
                                  : index[i] == 2
                                  ? Color(0xffFFCC80)
                                  : Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                const SizedBox(width: 5),
                                index[i] == 0
                                    ? Icon(
                                        Icons.school,
                                        color: Colors.blue,
                                        size: 14,
                                      )
                                    : index[i] == 1
                                    ? Icon(
                                        Icons.home,
                                        color: Colors.red,
                                        size: 14,
                                      )
                                    : index[i] == 2
                                    ? Icon(
                                        Icons.computer,
                                        color: Colors.white,
                                        size: 14,
                                      )
                                    : const SizedBox.shrink(),

                                SizedBox(width: 5),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    index[i] == 0
                                        ? 'University'
                                        : index[i] == 1
                                        ? 'Home'
                                        : index[i] == 2
                                        ? 'Work'
                                        : '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 42,
                            height: 29,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Color(0xff8687E7),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Icon(Icons.flag, color: Colors.white, size: 14),
                                const SizedBox(height: 4),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 327,
                    height: 72,
                    margin: const EdgeInsets.only(
                      bottom: 8,
                      left: 24,
                      right: 24,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff363636),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),

                      // Cercle gauche
                      leading: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFFFFFFDE),
                            width: 1.5,
                          ),
                        ),
                        child: Icon(Icons.check, color: Colors.white, size: 14),
                      ),

                      // Texte principal (1 seule ligne)
                      title: const Text(
                        'Do Math Homework and Physics Exercises', // Exemple long
                        style: TextStyle(
                          color: Color(0xFFFFFFDE),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Sous-texte
                      subtitle: const Text(
                        'Today At 16:45',
                        style: TextStyle(
                          color: Color(0xffAFAFAF),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
