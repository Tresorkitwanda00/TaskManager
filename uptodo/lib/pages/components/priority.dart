import 'package:flutter/material.dart';

class Priority extends StatefulWidget {
  final int currentPriority;
  final bool isEditing;
  Priority({this.currentPriority = 1, required this.isEditing});

  @override
  State<Priority> createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  int? selectedPriority;
  @override
  void initState() {
    super.initState();
    selectedPriority = widget.currentPriority;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(11),
        width: 327,
        height: 360,
        color: Color(0xff363636),
        child: Column(
          children: [
            Text(
              'Task Priority',
              style: TextStyle(
                color: Color(0xFFFFFFDE),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(width: 327, color: Color(0xff979797), height: 1),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  int priority = index + 1;
                  bool isSelect = selectedPriority == priority;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPriority = priority;
                      });
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: isSelect ? Color(0xff8687E7) : Color(0xff272727),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.flag,
                              color: isSelect ? Color(0xFFFFFFDE) : Colors.grey,
                            ),
                            SizedBox(height: 4),
                            Text(
                              '$priority',
                              style: TextStyle(color: Color(0xFFFFFFDE)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 133,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF272727),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xff8687E7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 133,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8687E7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, selectedPriority);
                    },
                    child: Text(
                      widget.isEditing ? "save" : 'Edit',
                      style: TextStyle(
                        color: Color(0xFFFFFFDE),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
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
}
