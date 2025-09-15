import 'package:flutter/material.dart';

class FormEditInfoUser extends StatefulWidget {
  final bool isUsernameOrPass;
  final String initialText;
  final Function(String) onSave;

  const FormEditInfoUser({
    super.key,
    required this.isUsernameOrPass,
    required this.initialText,
    required this.onSave,
  });

  @override
  State<FormEditInfoUser> createState() => _FormEditInfoUser();
}

class _FormEditInfoUser extends State<FormEditInfoUser> {
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
        height: widget.isUsernameOrPass ? 187 : 311,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.isUsernameOrPass
                    ? "Change account name"
                    : "Change account Password",
                style: const TextStyle(
                  color: Color(0xFFFFFFDE),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(height: 1, width: 325, color: Color(0xFFFFFFDE)),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(0),
              child: widget.isUsernameOrPass
                  ? _buildUsername()
                  : _buildTextFormFieldPass(),
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

  Widget _buildTextFormFieldPass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Enter old password',
          style: TextStyle(
            color: Color(0xFFFFFFDE),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _controller,

          obscureText: true,
          decoration: InputDecoration(
            hintText: ".....................",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xff979797),
                width: 0.8,
              ),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          'Enter new password',
          style: TextStyle(
            color: Color(0xFFFFFFDE),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _controller,

          obscureText: widget.isUsernameOrPass ? false : true,
          decoration: InputDecoration(
            hintText: ".....................",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xff979797),
                width: 0.8,
              ),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildUsername() {
    return TextFormField(
      controller: _controller,
      maxLines: null,
      decoration: InputDecoration(
        hintText: "Marlene Hays",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xff979797), width: 0.8),
        ),
        contentPadding: const EdgeInsets.all(8),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
