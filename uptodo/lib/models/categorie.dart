import 'package:flutter/material.dart';

class CategorieTask {
  final String nameCategory;
  final int codeValue;
  final IconData iconCategory;

  CategorieTask({
    required this.nameCategory,
    required this.codeValue,
    required this.iconCategory,
  });

  /// 🔄 Factory : convertir les données Firestore -> Objet Dart
  factory CategorieTask.fromMap(Map<String, dynamic> data) {
    assert(data['nameCategoy'] != null, "nameCategory manquant dans Firestore");
    assert(data['codeValue'] != null, "codeValue manquant dans Firestore");
    assert(
      data['iconCategory'] != null,
      "iconCategory manquant dans Firestore",
    );

    return CategorieTask(
      nameCategory: data['nameCategoy'] ?? 'Unknown',
      codeValue: data['codeValue'] ?? 0,
      iconCategory: data['iconCategory'] != null
          ? IconData(
              data['iconCategory']['codePoint'] ?? 0,
              fontFamily: data['iconCategory']['iconFamily'] ?? 'MaterialIcons',
            )
          : Icons.help, // icône par défaut si null
    );
  }

  /// 🔄 Méthode : convertir Objet Dart -> Map (pour Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nameCategory': nameCategory,
      'codeValue': codeValue,
      'iconCategory': {
        'codePoint': iconCategory.codePoint,
        'iconFamily': iconCategory.fontFamily,
      },
    };
  }
}
