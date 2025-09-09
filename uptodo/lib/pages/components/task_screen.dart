import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xff121212),
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.close, size: 24, color: Colors.white),
                Icon(Icons.repeat, size: 24, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 27),
          ListTile(
            leading: Icon(
              Icons.check_circle_outline,
              size: 24,
              color: Colors.white,
            ),
            title: Text(
              'Do Math Homework',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              'Do chapter 2 to 5 for next week',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Image.asset('assets/images/edit.png'),
          ),
          const SizedBox(height: 38),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ListTile(
                    leading: Icon(Icons.timer, color: Colors.white, size: 24),
                    title: Text(
                      'Task Time :',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 108,
                      height: 37,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0x36FFFFFF),
                        ),
                        child: Text(
                          'Today At 16:45',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ListTile(
                    leading: Icon(Icons.tag, color: Colors.white, size: 24),
                    title: Text(
                      'Task category :',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 108,
                      height: 37,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.school, color: Colors.blue, size: 24),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0x36FFFFFF),
                        ),
                        label: Text(
                          'Unversity',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ListTile(
                    leading: Icon(Icons.timer, color: Colors.white, size: 24),
                    title: Text(
                      'Priorty task:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 108,
                      height: 37,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0x36FFFFFF),
                        ),
                        child: Text(
                          'Default',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/hierarchy.png'),
                    title: Text(
                      'Sub task:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 108,
                      height: 37,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0x36FFFFFF),
                        ),
                        child: Text(
                          'Today At 16:45',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red, size: 24),
            label: Text(
              'Delete Task',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
