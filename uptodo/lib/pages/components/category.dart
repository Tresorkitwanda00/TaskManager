import 'package:flutter/material.dart';
import 'package:uptodo/pages/components/form_add_category.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  Category({required this.name, required this.icon, required this.color});
}

class CategoryModel extends StatelessWidget {
  List<Category> categpries = [
    Category(name: "Grocery", icon: Icons.shopping_cart, color: Colors.green),
    Category(name: "Work", icon: Icons.work, color: Colors.blue),
    Category(name: "Sport", icon: Icons.fitness_center, color: Colors.orange),
    Category(name: "Design", icon: Icons.brush, color: Colors.purple),
    Category(name: "University", icon: Icons.school, color: Colors.teal),
    Category(name: "Social", icon: Icons.group, color: Colors.pink),
    Category(name: "Music", icon: Icons.music_note, color: Colors.red),
    Category(name: "Health", icon: Icons.favorite, color: Colors.greenAccent),
    Category(name: "Movie", icon: Icons.movie, color: Colors.indigo),
    Category(name: "Home", icon: Icons.home, color: Colors.deepOrange),
    Category(name: "Create New", icon: Icons.add, color: Colors.grey),
  ];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 327,
        height: 556,
        color: Color(0xff363636),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Choose Category',
              style: TextStyle(
                color: Color(0xFFFFFFDE),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Container(width: 327, color: Color(0xff979797), height: 1),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: categpries.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final Category = categpries[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context, Category);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          color: Category.color,
                          child: Center(
                            child: Icon(
                              Category.icon,
                              size: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          Category.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 289,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8687E7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormAddCategory()),
                  );
                },
                child: const Text(
                  "Add Category",
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
      ),
    );
  }
}
