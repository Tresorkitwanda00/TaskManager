import 'package:flutter/material.dart';

class FormEditTask extends StatefulWidget {
  final bool isTaskOrSubtask;
  final String initialText;
  final Function(String) onSave;

  const FormEditTask({
    super.key,
    required this.isTaskOrSubtask,
    required this.initialText,
    required this.onSave,
  });

  @override
  State<FormEditTask> createState() => _FormEditTaskState();
}

class _FormEditTaskState extends State<FormEditTask> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff363636),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      content: SizedBox(
        width: 327,
        height: 225,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.isTaskOrSubtask ? "Edit Task Title" : "Edit Subtask",
                style: const TextStyle(
                  color: Color(0xFFFFFFDE),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(0),
              child: (widget.isTaskOrSubtask)
                  ? _buildTextFormField()
                  : _buildTaskOrSubTask(),
            ),

            Padding(
              padding: EdgeInsets.only(top: 17),
              child: (widget.isTaskOrSubtask)
                  ? _buildTaskOrSubTask()
                  : _buildTextFormField(),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff363636),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onSave(_controller.text);
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8687E7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
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
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: _controller,
      maxLines: null,
      decoration: InputDecoration(
        hintText: widget.isTaskOrSubtask ? "Enter task title" : "Enter subtask",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xff979797), width: 0.8),
        ),
        contentPadding: const EdgeInsets.all(8),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildTaskOrSubTask() {
    return Text(
      widget.isTaskOrSubtask
          ? "Do chapter 2 to 5 for next week"
          : "Do math homework",
      style: const TextStyle(
        color: Color(0xFFFFFFDE),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
