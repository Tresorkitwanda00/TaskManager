import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uptodo/models/categorie.dart';
import 'package:uptodo/services/categorie_controller.dart';

// 🔹 Widget principal
class CategoryModel extends StatefulWidget {
  final bool isEditing;

  const CategoryModel({super.key, required this.isEditing});

  @override
  State<CategoryModel> createState() => _CategoryModelState();
}

class _CategoryModelState extends State<CategoryModel> {
  CategorieTask? selectedCategory;
  CategorieController cls = CategorieController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 327,
        height: 556,
        color: const Color(0xff363636),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Choose Category',
              style: TextStyle(
                color: Color(0xFFFFFFDE),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Container(width: 327, color: const Color(0xff979797), height: 1),
            const SizedBox(height: 12),

            // 🔹 Liste depuis Firestore
            Expanded(
              child: StreamBuilder(
                stream: cls.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("Erreur : ${snapshot.error}");
                  }
                  final categories = snapshot.data ?? [];
                  return GridView.builder(
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                            Navigator.pop(context, selectedCategory);
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              color: category.codeValue != 0
                                  ? Color(category.codeValue)
                                  : Color(0xffAFAFAF),
                              child: Center(
                                child: Icon(
                                  category.iconCategory,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              category.nameCategory,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Boutons
            SizedBox(
              width: 289,
              child: (widget.isEditing == true)
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8687E7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>
                        form))
                      },
                      child: const Text(
                        "Add Category",
                        style: TextStyle(
                          color: Color(0xFFFFFFDE),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, selectedCategory);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff363636),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: const Text(
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
                                Navigator.pop(context, "edit");
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
            ),
          ],
        ),
      ),
    );
  }
}
