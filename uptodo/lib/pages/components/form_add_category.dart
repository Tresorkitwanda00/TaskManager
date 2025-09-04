import 'package:flutter/material.dart';

class FormAddCategory extends StatefulWidget {
  const FormAddCategory({super.key});

  @override
  State<FormAddCategory> createState() => _FormAddCategoryState();
}

class _FormAddCategoryState extends State<FormAddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(child: Container(width: double.infinity)),
    );
  }
}
