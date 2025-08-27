import 'package:flutter/material.dart';
import 'package:uptodo/pages/intro/start_screen.dart';

class Onboading extends StatefulWidget {
  const Onboading({super.key});

  @override
  State<Onboading> createState() => _OnboadingState();
}

class _OnboadingState extends State<Onboading> {
  int currentPage = 0;
  int totalPage = 3;
  void nextPage() {
    if (currentPage < totalPage - 1) {
      setState(() {
        currentPage++;
      });
    } else {
      print('Derniere page');
    }
  }

  void prevPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--; // reculer d’une page
        print(currentPage);
      });
    } else {
      print('Première page atteinte');
    }
  }

  final List<String> title = [
    "Manage your tasks",
    "Create daily routine",
    "Orgonaize your tasks",
  ];
  final List<String> subtitle = [
    "You can easily manage all of your daily\tasks in DoMe for free ",
    '''In Uptodo  you can create your 
    personalized routine to stay productive''',
    '''You can organize your daily tasks by 
    adding your tasks into separate categories''',
  ];
  final List<String> imagespath = [
    'assets/images/manage.png',
    'assets/images/routine.png',
    'assets/images/organize.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        leading: TextButton(
          onPressed: () {},
          child: Text('SKIP', style: TextStyle(color: Colors.grey)),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              if (imagespath.isNotEmpty)
                SizedBox(
                  width: 213,
                  height: 277.7,
                  child: Image.asset(
                    imagespath[currentPage],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          'Image non trouvée',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    },
                  ),
                ),
              Container(
                margin: EdgeInsets.only(left: 141, top: 40, right: 139),
                child: Row(
                  children: List.generate(
                    totalPage,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.only(right: 6),
                      width: 26,
                      height: 4,
                      decoration: BoxDecoration(
                        color: (currentPage == index)
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 53, top: 5, right: 53),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        title[currentPage],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          height: 1.5,
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        subtitle[currentPage],
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 650,
              left: (currentPage == 0 || currentPage == 1) ? 261 : 241,
            ),
            // padding: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
            width: (currentPage == 0 || currentPage == 1) ? 90 : 130,
            height: (currentPage == 0 || currentPage == 1) ? 48 : 48,
            child: (currentPage == 0 || currentPage == 1)
                ? ElevatedButton(
                    onPressed: nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff8875FF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff8875FF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      "GET START",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, top: 650),
            child: TextButton(
              onPressed: prevPage,
              child: Text('BACK', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
