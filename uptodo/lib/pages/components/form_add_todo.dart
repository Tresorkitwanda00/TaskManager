import 'package:flutter/material.dart';
import 'package:uptodo/pages/components/calendar.dart';
import 'package:uptodo/pages/components/category.dart';
import 'package:uptodo/pages/components/priority.dart';

class FormAddTodo extends StatefulWidget {
  const FormAddTodo({super.key});

  @override
  State<FormAddTodo> createState() => _FormAddTodoState();
}

class _FormAddTodoState extends State<FormAddTodo> {
  void showPriority() {
    showDialog(context: context, builder: (context) => Priority());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff363636),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      content: SizedBox(
        width: 375,
        height: 228,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(left: 25, top: 14),
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    color: Color(0xFFFFFFDE),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsetsGeometry.only(left: 25, top: 14, right: 26),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "My task",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: Color(0xff979797),
                        width: 0.8,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, top: 13),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Color(0xffAFAFAF),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final chosen = await showDialog<Category>(
                          context: context,
                          builder: (_) => CategoryModel(),
                        );
                      },
                      icon: Image.asset('assets/images/timer.png'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/tag.png'),
                    ),
                    IconButton(
                      onPressed: showPriority,
                      icon: Image.asset('assets/images/flag.png'),
                    ),
                    const SizedBox(width: 75),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const CalendarDialog(),
                          ).then((selectedDay) {});
                        },
                        icon: Image.asset('assets/images/send.png'),
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
  }
}
