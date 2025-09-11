import 'package:flutter/material.dart';

class ClockScren extends StatefulWidget {
  const ClockScren({super.key});

  @override
  State<ClockScren> createState() => _ClockScrenState();
}

class _ClockScrenState extends State<ClockScren> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Partie à travailler on focus ',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
