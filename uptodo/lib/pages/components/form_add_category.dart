import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FormAddCategory extends StatefulWidget {
  const FormAddCategory({super.key});

  @override
  State<FormAddCategory> createState() => _FormAddCategoryState();
}

class _FormAddCategoryState extends State<FormAddCategory> {
  bool isIcon = true;
  IconData? _icon;
  Color selectedColor = Colors.green;

  Future<void> _pickIcon() async {
    IconData? icon = await showIconPicker(
      context,
      iconPackModes: [IconPack.material, IconPack.fontAwesomeIcons],
    );

    if (icon != null) {
      setState(() {
        _icon = icon;
        isIcon = false; // on bascule pour afficher l'icône choisie
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----- Titre -----
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 70),
                child: Text(
                  'Create new category',
                  style: TextStyle(
                    color: Color(0xFFFFFFDE),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // ----- Nom de catégorie -----
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 24),
                child: Text(
                  'Category name :',
                  style: TextStyle(
                    color: Color(0xFFFFFFDE),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter category name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: Color(0xff535353),
                        width: 0.8,
                      ),
                    ),
                  ),
                ),
              ),

              // ----- Icône -----
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 24),
                child: Text(
                  'Category icon :',
                  style: TextStyle(
                    color: Color(0xFFFFFFDE),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 16),
                child: SizedBox(
                  width: isIcon ? 154 : 42,
                  height: isIcon ? 37 : 42,
                  child: isIcon
                      ? ElevatedButton(
                          onPressed: _pickIcon, // 🔹 Ouvre le picker
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0x36FFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Choose icon from library',
                            style: TextStyle(
                              color: Color(0xFFFFFFDE),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.32,
                            ),
                          ),
                        )
                      : Icon(_icon ?? Icons.home, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 24),
                child: Text(
                  'Category Color :',
                  style: TextStyle(
                    color: Color(0xFFFFFFDE),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 24, top: 16),
                child: BlockPicker(
                  pickerColor: selectedColor,
                  onColorChanged: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  layoutBuilder: (context, colors, child) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Wrap(
                            spacing: 8,
                            children: colors.map((color) {
                              final bool isSelected =
                                  // ignore: deprecated_member_use
                                  selectedColor.value == color.value; //
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    border: isSelected
                                        ? Border.all(
                                            color: Colors.white,
                                            width: 3,
                                          )
                                        : null,
                                  ),
                                  child: isSelected
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 24,
                                        )
                                      : null,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 325),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff8687E7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Create Category",
                          style: TextStyle(
                            color: Color(0xFFFFFFDE),
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
      ),
    );
  }
}
