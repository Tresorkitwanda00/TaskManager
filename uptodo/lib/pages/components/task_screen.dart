import 'package:flutter/material.dart';
import 'package:uptodo/pages/components/category.dart';
import 'package:uptodo/pages/components/delete.dart';
import 'package:uptodo/pages/components/form_edit_task.dart';
import 'package:uptodo/pages/components/priority.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String taskTitle = "Do Math Homework";
  String taskSubtitle = "Do chapter 2 to 5 for next week";

  void showPriority(bool isEditing) {
    showDialog(
      context: context,
      builder: (context) => Priority(isEditing: isEditing),
    );
  }

  void showCategorie(bool isEditing) {
    showDialog(
      context: context,
      builder: (context) => CategoryModel(isEditing: isEditing),
    );
  }

  void showDelete() {
    showDialog(context: context, builder: (context) => ShowDeleteMessage());
  }

  void showEditingForm(bool isTaskOrSubtask) {
    showDialog(
      context: context,
      builder: (context) => FormEditTask(
        isTaskOrSubtask: isTaskOrSubtask,
        initialText: isTaskOrSubtask ? taskTitle : taskSubtitle,
        onSave: (newValue) {
          setState(() {
            if (isTaskOrSubtask) {
              taskTitle = newValue;
            } else {
              taskSubtitle = newValue;
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close, size: 24, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.repeat,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Task affichée
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  size: 24,
                  color: Colors.white,
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      taskTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      taskSubtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => showEditingForm(true),
                  child: Image.asset('assets/images/edit.png'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Task Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.timer, color: Color(0xFFFFFFDE), size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Task Time :',
                      style: TextStyle(color: Color(0xFFFFFFDE), fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 120,
                  height: 37,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0x36FFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Today At 16:45',
                      style: TextStyle(color: Color(0xFFFFFFDE), fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Task Category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.tag_outlined,
                      color: Color(0xFFFFFFDE),
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Task category :',
                      style: TextStyle(color: Color(0xFFFFFFDE), fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 120,
                  height: 37,
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        final bool isEditing = false;
                        showCategorie(isEditing);
                      });
                    },
                    icon: const Icon(
                      Icons.school,
                      color: Colors.blue,
                      size: 18,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0x36FFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    label: const Text(
                      'University',
                      style: TextStyle(color: Color(0xFFFFFFDE), fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Priority
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.flag, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Priority task :',
                      style: TextStyle(color: Color(0xFFFFFFDE), fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 120,
                  height: 37,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        final bool isEditing = false;
                        setState(() {
                          showPriority(isEditing);
                        });
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0x36FFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Default',
                      style: TextStyle(color: Color(0xFFFFFFDE), fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Sub Task
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/hierarchy.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Sub task :',
                      style: TextStyle(color: Color(0xFFFFFFDE), fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 120,
                  height: 37,
                  child: TextButton(
                    onPressed: () => showEditingForm(false),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0x36FFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Edit Sub - Task',
                      style: TextStyle(color: Color(0xFFFFFFDE), fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Delete Task
            TextButton.icon(
              onPressed: showDelete,
              icon: const Icon(Icons.delete, color: Colors.red, size: 24),
              label: const Text(
                'Delete Task',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
            const SizedBox(height: 210),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8875FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text('Edit Task', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
